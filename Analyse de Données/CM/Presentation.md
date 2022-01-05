# Analyse de Données - Presentation

Le cours se veut accessible à tous, interactif.

On y verra les bases d'analyses, de statistiques de données et d'analyses descriptives.

Les TPs seront faits en langage **R**.

Un projet est à rendre pour le **15 mars**. Groupes composés de 3 informaticiens et 1 statisticien.

Les pré-requis :

- Quelques compétences en **R** :
    - Savoir utiliser **Rstudio**
    - Savoir utiliser les packages
- Savoir valoriser et interpréter les indicateurs statistiques

## L'analyse de données statistiques avec **R**

### Les métiers de la donnée

Selon *WiserSkills* :

- **Data Miner**
    - Analyse les données statistiques
    - Développe des scénarios prédictifs de comportement des utilisateurs
    - Conçoit des modèles de détection d'opportunités de marché
- **Data Analyst**
    - Analyse les données statistiques
    - Gère de grands volumes de données
- **Data Scientist**
    - Conçoit des programmes de [Machine Learning]("../Apprentissage Artificiel/CM/Presentation-1.md")
    - Gère le *scaling* de l'accès aux données
- **Chief Data Officer**
    - Gère le projet au niveau des choix techniques
- **Chief Data Protection Officer**
    - Définit et implémente les règles de protection des données
    - Conçoit des systèmes de stockage évitant les fuites, recoupements

### Vocabulaire de base

- **Statistique** : Un *résumé* de l'information contenue dans l'ensemble des observations
- **Description de données** : Un tableau regroupant des données correspondant à des descripteurs
- **Population** : Ensemble nombreux de données devant être bien définie. C'est *ce dont on parle*
- **Individus** ou **Unité statistique** : Element dénombrable composant une *population*
- **Caractère** : Permet de créer des sous-ensemble de populations en les classant selon des propriétés
- **Modalité** : Valeur d'un caractère pouvant être attribuée

Exemple : "La **Modalité** "M" (Masculin) du **Caractère** "sexe" de l'**Individu** étudié provenant de la population **Personnes recensées en France par l'INSEE**".

- **Variable quantitative** : Permet de mesurer une grandeur, *discrète* (nombre fini de valeurs possibles) ou *continue* (nombre infini cette fois-ci)
    - On peut utiliser ces variables pour faire des calculs (médiane, moyenne, ...)
    - En **R**, les variables quantitatives sont de type `numeric`.
- **Variable Qualitative** : Permet d'indiquer une valeur qui n'est pas une quantité, *ordonnée* (ses modalités expriment un ordre) ou *non ordonnée* (ses modalités n'en expriment alors pas)
    - On ne peut pas utiliser ces variables pour faire des calculs
<!-- cspell: disable-next-line --- Pour la définition de **ACM** -->
    - Ce type de données est notamment utilisée en **ACM** (**A**nalyse par **C**orrespondances **M**ultiples), que nous verront plus tard
    - En **R**, les variables qualitatives sont de type `factor`

- **Tendance centrale** : médiane, mode, moyenne, etc
- **Dispersion** : écart-type, variance, écart interquartiles
- **Mode** : maxima d'effectif local

### Statistiques peu influencées par les valeurs extrêmes

Les statistiques peu influencées par les valeurs extrêmes (les valeurs les à gauche et droite sur un graphique) sont dites "non paramétriques" car elles ne supposent pas de distribution de la variable étudiée.

Par exemple, la *médiane* est peu influencée par les valeurs extrême : elle est basée uniquement sur le nombre d'individus. En effet, pour $n$ individus, la médiane vaut la valeur observée par le rang $n/2$ (si $n$ est pair, la médiane vaut en **R** la moyenne entre les deux rangs les plus proches de $n/2$ en arrondissant, grâce à la fonction `median()`).

Les *quartiles* sont des sous-groupes d'une population formés de manière à ce qu'ils aient tous le même nombre d'individus. Ils ressemblent ainsi à la médiane. On forme donc 3 bornes. En **R**, on peut utiliser la fonction `quantile()` qui retourne des quartiles par défaut. À noter qu'elle peut aussi renvoyer n'importe quels percentiles de notre choix.

### Statistiques fortement influencés par les valeurs extrêmes

Ces statistiques sont, au contraires, influencées par les valeurs extrêmes de la distribution?

On peut citer parmi ces statistiques la **moyenne arithmétique** (la moyenne traditionnelle qu'on apprends dès la primaire, la somme de tous les éléments divisée par le nombre d'éléments). C'est une statistique de tendance centrale représentant la valeur de chaque élément si tous les éléments étaient distribués de manière égale. En **R**, la fonction `mean()` permet de l'obtenir.

Il existe aussi la **moyenne géométrique**, de formule, elle aussi de tendance centrale et fortement influencées par l'allure de la distribution.

### Indicateurs de dispersion

Les statistiques de dispersion représentent l'hétérogénéité de la population étudiée, de différentes manières

La **variance** est une statistique de dispersion. C'est la moyenne des carrés des écarts à la moyenne. En **R**, on la calcule avec la fonction `var()`

L'**écart-type**, statistique basée sur la *variance*, est plus populaire que celle-ci. il s'agit de sa racine carrée.

L'**étendue** est l'écart entre la valeur maximale et la valeur minimale de la population.

Le **Coefficient de variation** (*CV*)est une statistique de dispersion *relative*: elle mesure l'écart relatif es valeurs d'une population à sa valeur centrale. Il permet de comparer des variable sd'ordre de grandeur très différents (par exemple ``[0,10]`` avec ``[-100,100]``,qui auraient des distributions naturellement très différentes en terme de valeurs).

### La boîte à moustache

La boîte à moustache permet de visualiser  une population de manière statistique en mettant en évidence sa médiane, ses quartiles et ses valeurs extrêmes

En **R**, on peut utiliser la fonction ``boxplot()`` avec l'argument ``geom_violin`` pour obtenir des violons, permettant de visualiser les forme des valeurs de la série en plus du reste.

### Les statistiques bivariées

Il est possible de transformer une variable quantitative en variable qualitative (en classe). On prends comme classe de chaque individu sa valeur de la variable étudiée. Il est au contraire impossible transformer une variable qualitative en variable quantitative

Le test du $\chi^2$ permet de mesurer le degré de dépendances de deux variables qualitatives. Le $\chi^2$ calculé s'obtient en faisan la somme de $(O-T)^2/T$. On calcule le degré de liberté en faisant $(c-1) * (l-1)$ avec $c$ le test calculé et $l$ le test lu pour 5%.

*Yates* propose une correction de l'approximation pour la en ajustant la formule du continuité $\chi^2$ :

## Application sous **R**

<!-- TODO : A Compléter (l'idée là c'est de refaire la machin et de commencer la cheatsheet en projet) -->

## Sources

- CM de Monsieur Bruno Dardaillon du 4/01/2022
