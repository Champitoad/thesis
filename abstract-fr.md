Les assistants de preuve sont des logiciels permettant de vérifier
rigoureusement des raisonnements mathématiques. Ils peuvent être généraux (comme
Coq, Lean, Isabelle...) ou plus spécialisés (comme EasyCrypt). Ils permettent un
niveau de précision qui certifie qu'aucune erreur ne peut se produire, ont donné
naissance à une large gamme de travaux pratiques et théoriques, et ont été
utilisés dans une grande variété d'applications. Mais ils restent difficiles à
utiliser.

Nous proposons un nouveau paradigme de construction de preuves formelles par
actions effectuées dans une interface graphique, afin de permettre une
utilisation plus confortable et plus intuitive. Notre paradigme s'appuie sur des
principes de manipulation directe, combinant des techniques d'interactions
anciennes (Proof-by-Pointing) et récentes (Proof-by-Linking), qui exploitent les
dernières avancées en théorie de la démonstration par inférence profonde. Nous
implémentons ce paradigme dans un prototype d'interface graphique appelé Actema,
basé sur des technologies web modernes. Nous concevons également un protocole
générique pour connecter Actema à n'importe quel système de preuve qui supporte
la logique intuitionniste du premier ordre. Ce protocole est déployé dans
l'assistant de preuve Coq grâce au plugin coq-actema, offrant aux utilisateurs
la possibilité d'intégrer des preuves graphiques dans des développements
textuels existants.

Puis, animés par la volonté d'améliorer les diverses techniques d'interaction
d'Actema dans un formalisme unifié, nous explorons une série de systèmes
d'inférence profonde qui donnent plus de structure à la notion de but logique.
Ces systèmes ont en commun de pouvoir représenter les buts de deux manières
alternatives : soit textuellement à travers une syntaxe inductive standard, soit
graphiquement à l'aide d'une notation métaphorique adaptée à la manipulation
directe.

La première famille de systèmes, appelée calculs de bulles, est une extension de
la théorie des séquents imbriqués, que nous reformulons comme des systèmes de
réécriture locaux avec une interprétation graphique et topologique. Les calculs
de bulles permettent un partage efficace des contextes communs entre sous-buts,
facilitant la factorisation des étapes de raisonnement avant et arrière dans les
démonstrations. Le second système, appelé calcul des fleurs, est un raffinement
intuitionniste de la théorie des graphes existentiels de C.S. Peirce, comprise
comme un système de construction interactive de preuves dirigée par les buts. Il
fournit des moyens de raisonner plus iconiques et économiques que les calculs de
bulles, en exposant moins de règles d'inférence, et en les faisant s'appliquer
directement aux buts eux-mêmes, supprimant ainsi le besoin de manipuler des
connecteurs logiques. Les deux types de systèmes sont démontrés analytiques et
complètement inversibles, ce qui les rend adaptés à des techniques
d'automatisation de la preuve.
