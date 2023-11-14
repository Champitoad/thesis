local M = {}

-- Copied from:
-- http://lua-users.org/wiki/StringInterpolation
local function interp(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

-- Evaluate the bezier polynomial at t
local function beval(p1, c1, c2, p2, t)
  return t * t * t * p1
       + 3 * (1 - t) * t * t * c1
       + 3 * (1 - t) * (1 - t) * t * c2
       + (1 - t) * (1 - t) * (1 - t) * p2
end

local function control_size(radius, a1, a2, l)
  local x = math.cos(a1) + math.cos(a2)
  local y = math.sin(a1) + math.sin(a2)
  local norm = math.sqrt(x * x + y * y)
  local d = 8 * l / norm - 4 * radius
  d = d / 3
  return d
end

function M.one(f)
  local pistil = f.pistil or {}
  local flower = {
    center = f.center or "0,0",
    angle = f.angle or 0.0,
    petal_size = f.petal_size or (pistil.size or 1) * 3,
    petal_color = f.petal_color,
    pistil = {
      color = pistil.color or "pistil",
      size = pistil.size or 1.0,
    },
    petals = f.petals or {{},{},{}},
  }
  -- Petal arguments
  -- name: string -- Name of the center of the petal. If nil the petal isn't drawn
  -- shift: float -- Shift to position of the center of the petal
  -- color: string -- Background color of the petal
  -- tikz: string -- Arguments added to the draw call
  if #flower.petals < 3 then
    io.stderr:write(string.format("Expected at least 3 petals, got %d.\n", #f.petals))
    return
  end

  tex.print(string.format("\\begin{scope}[shift={(%s)}]\n", flower.center))

  local step = 2 * math.pi / #flower.petals
  local start = flower.angle + (math.pi - step) / 2
  local radius = flower.pistil.size
  for i=1,#flower.petals do
    if flower.petals[i].name then
      local a1 = start + (i-1) * step
      local a2 = start + i * step
      local size = control_size(radius, a1, a2, flower.petal_size)
      local p1 = { x = math.cos(a1) * radius, y = math.sin(a1) * radius }
      local c1 = { x = p1.x + math.cos(a1) * size, y = p1.y + math.sin(a1) * size }
      local p2 = { x = math.cos(a2) * radius, y = math.sin(a2) * radius }
      local c2 = { x = p2.x + math.cos(a2) * size, y = p2.y + math.sin(a2) * size }

      local top = {
        x = beval(p1.x, c1.x, c2.x, p2.x, 0.5),
        y = beval(p1.y, c1.y, c2.y, p2.y, 0.5),
      }
      local border = {
        x = radius * math.cos((a1 + a2) / 2),
        y = radius * math.sin((a1 + a2) / 2),
      }
      local shift = flower.petals[i].shift or 1
      local center = {
        x = border.x + shift * (top.x - border.x) * 0.5,
        y = border.y + shift * (top.y - border.y) * 0.5,
      }

      local fill = flower.petals[i].color or f.petal_color or nil

      tex.print(interp([[
  \draw[black${fill}${args}] (${p1x},${p1y}) .. controls (${c1x},${c1y}) and (${c2x},${c2y}) .. (${p2x},${p2y});
  \coordinate (${name}) at (${ctx},${cty});
  \coordinate (${name}-top) at (${topx},${topy});]], {
        p1x = p1.x, p1y = p1.y,
        p2x = p2.x, p2y = p2.y,
        c1x = c1.x, c1y = c1.y,
        c2x = c2.x, c2y = c2.y,
        ctx = center.x, cty = center.y,
        name = flower.petals[i].name,
        topx = top.x, topy = top.y,
        args = flower.petals[i].tikz and string.format(",%s", flower.petals[i].tikz) or "",
        fill = fill and string.format(",fill=%s", fill) or "",
      }))
    end
  end

  tex.print(interp([[
  \draw[black,fill=${color}] (0,0) circle (${radius});]], {
    radius = flower.pistil.size,
    color  = flower.pistil.color,
  }))

  tex.print("\\end{scope}\n")
end

function M.many(fs)
  for _,v in pairs(fs) do
    M.one(v)
  end
end

return M
