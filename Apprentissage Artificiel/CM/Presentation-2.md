# Apprentissage Artificiel - Cours 0 - Partie 2

## ???

<!-- TODO : Compléter -->

### Exemple simple : les `k` plus proches voisins

On définit la classe d'un exemple comme un "vote" majoritaire des `k` plus proches voisins. C'est-à-dire qu'on regarde les `k` (`k` entier strictement supérieur à `1` fixé au préalable) voisins les plus proches de notre point, et qu'o attribue à notre point la classe dont la majorité des voisins font partie.

On peut se demander s'il est possible de faire un "vote" plus performant : Il est tout à fait possible que les plus proches voisins soient majoritairement de la mauvaise classe en fonction du choix de `k`. Par exemple :

<!-- TODO : Ajouter une image d'illustration -->

par exemple, on peut utiliser une pondération :

- Par rapport au nombre d'éléments dans une classe
- Par rapport à la distance euclidienne
- Par rapport à une distance euclidienne pondérée

Le souci, c'est la valeur de `k`. Plus celle-ci est grande, plus le coût de calcul est grand. A chaque fois qu'on ajoute un point, on doit calculer le résultat du vote de **tous** les autres points. De plus, l'algorithme ne fonctionne bien que s'il possède des points bien répartis dans ses données.

### Une idée : utiliser des probabilités

#### La règle de classification bayésienne

> La règle de classification bayésienne ou **Maximum a posteriori** (règle MAP) consiste à trouver un algorithme `h*` qui attribue à tout point `x` une classe `c*` qui est celle qui a la plus forte probabilité a posteriori d'avoir engendré `x`.
> `h*` choisit la classe `c*`; telle que ``c*; = argmax[i] P(c_{i}|x)``

<!-- TODO: Compléter, pas le temps de recopier et j'ai plus les souvenirs des intégrales en LaTeX -->

##### Démonstration de l'optimalité de la règle MAP

Soient :

- `h*` la règle de décision bayésienne : ``c*; = argmax[i] P(c_{i}|x)``
- `h_{0}` la règle de décision optimale : elle ne se trompe jamais et affecte à tout `x` sa vraie classe
- `h` une règle de classification quelconque.

On cherche à démontrer que l'erreur moyenne de `h*` est toujours plus faible que `h`, quel que soit `h`

<!-- TODO : Compléter, même raison que plus haut -->

##### Théorème de Bayes

Soient A et B deux évènements, la probabilité de A sachant B vérifie :

$$
P(A|B) = \frac{P(B|A)P(A)}{P(B)}
$$

``P(B|A)`` est la fonction de vraisemblance de `A`, ``P(A)``  et ``P(B)`` sont les probabilités a priori de `A` et de `B`.

En effet, par définition, on a :

$$
P(A|B)P(B) = P(A \cap B)
$$

<!-- TODO : Compléter, même raison que plus haut -->

#### L'estimation de la probabilité a priori $P(C_{i})$

Si on n'a aucune information; on suppose toutes les classes équiprobables :

$$
\forall i,P(C_{i}) = \frac{1}{C}
$$

Si on suppose aue l'échantillon d'apprentissage est non-représentatif (de notre cas réel donc), on estime la fréquence d'apparition des classes (cf partie précédente) :

$$
P(C_{i}) = \frac{nombre d'exemples dans la classe}{nombre d'exemples total} = \frac{\sum_{k=1}^{n} 1_{c_{x_{k}} = c_{i}}}{n}
$$

Une solution intermédiaire (formule de Laplace) est à utiliser dans le cas où la fréquence d'apparition des classes est imprécise par manque d'exemples.

$$
P(C_{i})
$$

<!-- TODO : Compléter -- Je fais de mon mieux mais là c'est dur -->

Deux approches possibles :

- Les approches locales (non-paramétriques) où l'on estime les densités de probabilité $P(x|c_{i})$ au point `x` en regardant les points d'apprentissage autours de l'exemple `x`.
- les approches paramétriques où l'on définit un modèle de loi de probabilité en calculant ses paramètre. On modifie ensuite cette loi en fonction des exemples d'apprentissage.

##### Principe de solution pour une estimation locale

On va formuler ce problème mathématiquement :

Soient :

- $R_{m}$ une région de volume $V_{m}$ autour du point $x$.
- $m$ le nombre de points de la classe dans l'ensemble d'apprentissage
- $k_{m}$ le nombre de points de l'ensemble d'apprentissage qui appartiennent à la classe testée et qui sont dans $R_{m}

On a donc :

$$
P(x|c_{i}) = \frac{k_{m}/m}{V_{m}}
$$

L'estimateur converge vers $P(x|c_{i})$ quand $m \rightarrow \infty$ si :

$$
\lim_{n \rightarrow \infty}
$$

<!-- TODO : Compléter -- Je fais de mon mieux mais là c'est dur -->

Au regard de l'étude précédente se dégagent deux solutions :

1. Fixer la forme et le volume de la région
2. On fixe le nombre de points dans la région (méthode des `k` plus proches voisins)

<!-- TODO : Compléter -- je me tape un mal de crane immense, je m'arrete de noter ici pour le moment -->

## Sources

- CM de Monsieur Alexis Lechervy du 3/01/2022
