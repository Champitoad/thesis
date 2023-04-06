# Part 0: Preliminaries

(?)

# Part 1: Manipulating Formulas

- Proof-by-Pointing
  - Sequent calculus
  - The algorithm

- Proof-by-Linking
  - Extending PbP
    - Singly deep
    - Doubly deep
  - Subformula linking
    - Intuitionistic
    - Classical
    - Quantifiers
    - Equality

- Proof-by-action
  - Hyper-linkages
  - Action predicates
  - Prototype implementation: Actema
  - Integration with proof assistants: coq-actema

# Part 2: Manipulating Goals

- Bubble calculus
  - Intuitionistic Single-Succedant
    - Graphical
    - Textual/Inductive
  - Intuitionistic to Classical Multi-Succedant
    - Graphical
    - Textual/Inductive

- Existential graphs
  - Classical
    - Propositional (alpha)
      - Graphical (topological?)
      - Textual/Inductive
    - First-order (beta)
      - Lines of identity
      - Variables + Equality predicate
      - Textual/Inductive
  - Intuitionistic
    - The Scroll (⊤, ∧, ⊃)
    - N-ary scrolls (⊥, ∨)
    - Flower calculus (alpha)
    - Flower calculus (beta)
  - Admissibility of erasure
    - Positive subgraph
    - Double-cut
  - Subformula linking in EGs
  - SFL-based proof search
  - Towards a Curry-Howard correspondance for flowers