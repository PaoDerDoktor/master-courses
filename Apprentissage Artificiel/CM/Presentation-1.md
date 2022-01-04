# Apprentissage Artificiel - Cours 0 - Partie 1

L'idée de cette matière est de permettre à des machines **d'apprendre**. Apprendre c'est :

- S'adapter à des situations nouvelles et inconnues
- Utiliser les expériences passées et leur résultats
- Résoudre plus efficacement des tâches

Mais ce n'est pas :

- Réciter par coeur (*hard coding*)
- Appliquer un code préexistant

## Notion d'apprentissage en informatique

### Intérêt

On applique l'apprentissage lorsque l'on est confronté à des problèmes très complexes (grands ensembles de données, hautes variabilités, peu de connaissances) et difficile à décrire. On cherche donc à effectuer des actions selon un contexte imprévisible au préalable, sans faire intervenir un humain (besoin de temps réel, trop grande complexité cognitive, etc).

### Définition

> Un programme informatique est un algorithme d'"apprentissage automatique" si à partir d'une base d'expérience `E`, une certaine tâche `T` et une certaine mesure de performance sur cette tâche `P`, il améliore ses performances sur `T` vis-à-vis e la mesure de performance `P` au moyen des expériences `E`.

Par exemple, `P` peut être un pourcentage de fois où l'algorithme se trompe sur une tâche `T` de reconnaissance d'image (pourcentage de mauvaise reconnaissance).

### Objectifs

- **Explorer** : décrire les variables, leurs liens entre eux (ex: Économie)
- **Expliquer** : tester l'influence d'une variable dans un modèle donné (ex: Météorologie)
- **Prévoir et Sélectionner** : prévoir un résultat et l'expliquer en présentant certaines variables (ex: Diagnostic médical)
- **Prévoir** : Simplement prévoir un résultat (ex: Reconnaissance faciale)

### Quand l'utiliser ?

L'apprentissage n'est pas simple à mettre en place : il peut y avoir des coûts à cause du besoin de recherche dans des bases de données, de l'annotation par des humains, etc. Il est donc parfois plus pertinent d'utiliser des méthodes plus traditionnelles. Il convient donc pour les experts - nous - de discerner les détails indiquant le besoin d'utiliser plutôt une approche classique :

- Si le problème est simple à décrire (resumable avec une simple interface graphique, peu coûteux en temps, ...)
- Si le problème est simple à résoudre avec une simple expertise humaine
- Si le problème implique le traitement d'un trop gros nombre de données différentes
- Si le problème est facile à prévoir (on sait qu'on aura pas besoin de temps réel dans des contextes difficiles à décrire)
- ...

De la même manière, il existe certains signes indiquant la pertinence de l'apprentissage:

- Si le problème est facile à résoudre pour un humain mais pas par une machine (reconnaissance faciale/vocale)
- S'il n'est pas possible de trouver une solution optimale de manière analytique

## Exemples d'apprentissages

### Navigation autonome

Le *DARPA Grand Challenge* teste depuis 2004 la navigation autonome de véhicules.

En 2005, la gagnante à parcouru 213km en 6h54 dans le Mojave (désert de Las Vegas)

En 2007, les véhicules ont parcouru 94km en moins de 6h dans un contexte urbain en respectant le code de la route et de la circulation

Ces systèmes utilisent énormément de "briques" :

- Système de trajectoire
    - Données de traffic
    - Graphe des routes
    - Qualité des routes
- Capteurs
    - Où est la Route
    - Piétons
    - Véhicule
    - Signalisation
- Vitesse du moteur, chaleur, etc

### Suivi en temps réel de personne dans une foule

On peut essayer de chercher à récupérer des personnes dans une foule.

- Détection des

### Diagnostic médical

On peut chercher à analyser automatiquement les résultats de prélèvements . Par exemple, on peut détecter les cellules cancéreuses déformant les noyaux cellulaires en cherchant à segmenter automatiquement les noyaux sur des prises de vues.

On évite ainsi les erreurs : la plupart des cellules sont normales, seules certaines vont présenter les signes de maladie. On évite les imperfections des humains (fatigue, manque d'attention) en filtrant les données (on *skip* les cellules normales et on présente au médecin les cellules *louches*) par exemple

On peut aussi grâce à des données génétiques chercher les facteurs à risque d'une maladie, pour éventuellement la prévenir ou la corriger chez les personnes présentant les gènes concernés

Avec Watson d'IBM, on est aujourd'hui capable d'obtenir des diagnostics du niveau d'experts médicaux

### Recommandations de commerce

On retrouve des algorithmes de recommandation partout (amazon, youtube, ...) : le but est de comprendre la personnalité (qui nous sommes, nos centre d'intérêt, ce qui nous rebute) afin de recommander les produits ayant le plus de chances de nous plaire

Ainsi le monde commercial est très friand d'algorithmes d'apprentissage pour booster les ventes et analyser les marchés.

## Les étapes d'un projet d'apprentissage automatique

1. Définir le problème à résoudre
2. Construire la base de données
    1. Acquérir les données
    2. preparer et nettoyer les donnees
    3. repartir les donnees
3. Définir une representation des donnees
4. choisir entraîner évaluer et optimiser

<!-- A FINIR -->

Souvent on se concentre trop sur le 4e point

### Définir le problème d'apprentissage

On se pose différentes questions ?
Quels sont mes données (sons, images, vidéos...) ? Quels sont mes utilisateurs (humains, entreprises, agents, ...) ? Comment je les fait interagir ? Quel famille d'algo ?

-> On commence par poser le problème, on n'agit pas selon les modes mais selon la nature des données

### Construire la base de données

<!-- TODO: Corriger tout ca -->

Les algo d'apprentissage auto reposent **sur des données**. Elles sont trop souvent oubliées : mais pour avoir des apprentissages de qualité (surtout sur les algo à la mode), il faut BEAUCOUP de données

Si on cherche en tant qu'humain à définir à l'année près l'age d'une personne, on a du mal. mais il existe des algorithmes ayant de bien meilleures performances. Mais pour que cela fonctionne, il faut des millions de visages : l'algo s'entraîne sur des données, et plus il y a de données plus l'algorithme a rencontré de cas, ce qui lui permet de prévoir plus de nouveaux cas inconnus

On procède ainsi :

- Récolte de données pertinentes, en **quantité** et en **qualité** suffisantes
- On analyse ces données. On retire les données incomplètes (par exemple, dans les données des détenus francais, les données sont plus ou moins précises ("roux" VS "roux clair"), parfois manquantes puisque non notées, etc.) et on détecte les biais. Cette étape coûte beaucoup de temps. Par exemple, on utilise parfois les captcha pour faire en sorte que les gens annotent gratuitement le label de certaines images. on demande la même chose à plusieurs humains, et on se sert de leur jugement pour annoter des ensembles d'entraînement. On évite les biais de genres, biais racistes, etc (plus d'homme que de femme dans les données, plus de personnes 30-50 ans peu de personnes âgées etc). L'algo est performant sur les données qu'il a, cela pose un vrai problème de société : **Les programmes apprennent les biais**
- Préparer et nettoyer les données, retoucher les données pour faciliter leurs utilisations, normaliser les attributs, supprimer les données inutilisables ou les attributs inutiles. On peut renforcer ou diminuer les contrastes, normaliser les valeurs, supprimer les grands écarts entre variable, supprimer le bruit, les attributs non pertinents, corriger les annotations...

Dans le cas de biais connus et inévitables (ex: manque de visages de plus de 100 ans puisqu'il y en a peu dans la société), on peut essayer d'injecter des corrections.

La phase de construction de la base de données et **primordiale** pour que l'algo fonctionne bien. La récupération et l'annotation coûte cher : les données personnelles d'une seule personne n'ont aucune valeur. Mais en grand nombre elles valent de l'or.

#### Comment créer des jeux de données ?

##### Les jeux de données

Les jeux de données sont des sous-ensembles distincts de données provenant de la base créée au préalable permettant la réalisation de différentes missions

- ***T*rain** : Données d'apprentissage sur lesquelles s'entraîne tout d'abord l'algorithme
- ***V*al** : Données permettant de valider le bon déroulement de l'entraînement. Il permet aussi notamment de régler les paramètres et hyperparameter de la méthode d'apprentissage
- ***T*est** : Données permettant de mesurer les performances de la méthode

> Chacun des ensembles doit être statistiquement représentatif des données que vous pouvez rencontrer.
> Vous pouvez, par exemple, tirer au hasard de façon uniforme chacun des trois ensembles en respectant l'équilibre des classes.

On cherche à obtenir les performances, et parmi elles les écart-types : Si un algo fait 91%+/-3% et l'autre 90+/-0.5%, on peut penser que le deuxième algo sera bien meilleur puisque plus précis (88 VS 89.5) au minimum (selon les besoins)

### Définir la représentation des données

Il est très important de passer des données récupérées à n ensemble utilisable par un programme

souvent, on utilisera de très grands vecteurs en plusieurs dimensions. Ainsi on récupère des points dans espaces en x dimensions, et on cherche les frontières entre les différentes classes de points en fonction de leur coordonnées

### Choisir et entraîner un modèle d'apprentissage

On a plusieurs type d'apprentissages :

#### L'apprentissage en une fois (*batch learning*)

Le plus courant des apprentissages.

On prends notre base de données; on entraîne une seule fois notre algorithme. On l'utilise ensuite

Avantages :

- L'apprentissage est fait une fois

Inconvénients :

- On doit recommencer si on a de nouvelles données

#### L'apprentissage interactif

On cherche ici à avoir un système capable d'apprendre des concepts en annotant le moins d'images possibles. On établit alors un dialogue entre le système et l'utilisateur

Par exemple, on a tout une base d'images non-annotée. On cherche les images contenant le Père Noël. On donne à l'algorithme une image-requête qu'il ne connaît pas à l'avance. Le système réponds par un certain nombre d'images, incertaines au système. On lui réponds en lui indiquant les images qui nous intéressent par rapport à l'image-requête, et l'ordinateur répondra à nouveau, annotant et se perfectionnant au passage.

On a donc des algorithmes moins coûteux à annoter, mais il faut bien coder l'annotation avec des humains.

Dans ce cours; on va plutôt se concentrer sur les approches *batch-learning*

### Évaluer et optimiser un modèle d'apprentissage

Plusieurs méthodes existent :

#### La validation croisée

Le processus d'apprentissage optimise les paramètres du modèle afin de minimiser un critère d'erreur sur la base d'apprentissage. Il est important de choisir les hyperparamètres sur un échantillon de validation indépendant automatiquement distribué

L'idée est de récupérer l'état de notre apprentissage

#### La validation croisée à `k` blocs

<!-- TODO : Insérer image d'exemple -->

La validation croisée à `k` blocs à pour principe de faire de multiples apprentissages :

On sépare les données en k blocs et on regarde l'erreur moyenne sur ces k blocs pour récupérer le plus pertinent

#### La validation croisée d'un contre tous

<!-- TODO : Insérer image d'exemple -->

Même principe que la validation croisée à `k` blocs, mais ici on utilise toutes les données sauf le ième exemple pour choisir les meilleurs éléments de tout l'ensemble d'apprentissage

On fait souvent ca lorsqu'on a tres peu d'ensemble d'apprentissage afin de pouvoir optimiser l'apprentissage. On effectue ça en parallèle

### Tester

- On évalue les performances sur un ensemble de test indépendant des données d'entraînement
- On vérifie l'absence de suraprentissage (performances extrêmement bonnes sur la base d'apprentissage mais pauvres sur la base de test (proches du hasard))
- On mesure le temps d'execution, ou encore la mémoire

### Deployer

Cette étape existe très peu dans la recherche mais est quasi-systématique (et assez gourmande en temps de développement) dans l'industrie. L'idée est de préparer notre algorithme ayant appris à être *utilisé*.

- On l'optimise en temps, mémoire, etc
- On le prépare à l'utilisation sur logiciel ou dun matériel dédié
- On le met en production
- On le ré-entraîne sur des nouvelles données si besoin
- On le maintient (debug etc)

## Les familles d'algorithmes d'apprentissage

### L'apprentissage non-supervisé (Clustering)

Voici les étapes du clustering :

- Diviser es données en plusieurs groups séparés
- Extraire une connaissance organisée sans intervention humaine
- Les données les plus similaires sont associées au sein d'un groupe homogène
- Les données considérées comme différentes se retrouvent dans d'autres groupes distincts
- **Pas d'a-priori sur les données (on les connaît pas à l'avance, on ne sait pas ce qu'on recherche)**
- Il y a une seule entrée, les données collectées

<!-- TODO : Insérer image d'exemple -->

On ne peut pas tout obtenir avec cette approche : elle peut nous donner des résultats qui ne nous intéressent pas ou qui ne sont pas bien pertinents, par manque d'intervention humaine

### L'apprentissage supervisé

Dans le cas où la méthode précédente ne peut s'appliquer, on peut utiliser celle-ci

- On détermine automatiquement une règle à partir de données d'apprentissage annotées par un expert
- Un expert a défini un ensemble de couples ``(donnée, label)``
- On a un a-priori sur les données
- On a deux entrées, les données collectées et leurs labels

Grâce à l'a-priori, on obtient ce que l'on recherche

### La régression

Voici le principe de la régression :

- Trouver la relation entre une variable et une ou plusieurs autres variables
- Trouver la fonction qui minimise un critère d'erreur entre les valeurs de la fonction aux points d'apprentissage et les observation

<!-- TODO : Insérer images d'exemple -->

### La classification

- On attribue une classe à chaque élément de nos données
- On utilise des données statistiques sur chaque objet pour en choisir la classe (Pour une image : analyse des bords, couleurs)

### L'estimation de densité

Trouver les paramètres d'une loi de probabilité permettant d'estimer au mieux une distribution de points

ex: <https://thispersondoesnotexist.com>

L'estimation de densité est très appréciée en génération de média

<!-- TODO : Ajouter des infos, j'ai eu un message important :x (et je fatigue sah) -->

## ??

### Vecteur de caractéristique simple

> certaines bases de données sont directement sous la forme d'un vecteur par exemple d'apprentissage. Elles ne nécessitent pas de traitement particulier et peuvent être traitées directement par les algorithmes d'apprentissage automatique.

Exemple : la base d'Iris de Fisher

La base est disponible à <https://archive.ics.uci.edu/ml/datasets/iris> <!-- TODO : compléter -->

(Note : d'une manière générale, <https://archive.ics.uci.edu/ml/datasets> contient beaucoup d'ensembles fonctionnels pour s'entraîner ou s'améliorer à différents algorithmes)

#### Voir une image comme un vecteur de pixels

<!-- TODO : Insérer images d'exemple -->

### Comment construire un descripteur pour les images

L'idée, c'est de récupérer des variables intéressantes pour ce qu'on veut distinguer, et d'en construire un vecteur de propriétés statistiques

Par exemple, si on veut trouver des pommes Pink Lady ou de magnifiques Ferrari [Testarossa](https://www.youtube.com/watch?v=ErQNRwH-Hmk), le taux de rouge peut être un très bon descripteur

On peut aussi essayer de récupérer les contours d'un objet, l'écart de pixels proches, le taux d'une certaine texture dans une image, l'utilisation de certains mots dans un texte, etc.

#### Les histogrammes de gradients orientés (**HOG**)

Le principe est de calculer des gradients de l'image selon un nombre donné d'orientations.

On procède ainsi :

1. Calcul du gradient de l'image
    - Par un filtre dérivatif horizontal ``[-1, 0, 1]`` et vertical ``[-1, 0, 1]`` <!-- FIXME: erreur ? -->
    - Par un filtre de Sobel
2. <!-- TODO : Completer -->

## Sources

- CM de Monsieur Alexis Lechervy du 4/01/2022
