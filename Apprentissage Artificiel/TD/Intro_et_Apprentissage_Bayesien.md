# TD 1 : Introduction et Apprentissage Bayésien - Classification

## Méthode par `k` plus proches voisins

> Soit un espace euclidien $\varepsilon$ de dimension 2 muni de plusieurs points appartenant à deux classes $C_1$ et $C_2$. On dispose des points $x_1 = (2, 1)$ et $x_2 = (1, 3)$ e la classe $C_1$ et des points $x_3 = (2, 5)$ et $x_4 = (4, 3)$ de la classe $C_2$.

### Question 1.1)

> Déterminez la classe des points $x_5 = (2, 2)$ et $x_6 = (2, 4)$ par une méthode des k-plus proches voisins pour $k=1$

On calcule les distances euclidiennes entre chacun des points $x_{1..4}$ et $x_5$ :

$$
\begin{aligned}
    ||x_5 - x_1|| &=& \sqrt{(2 - 2)^2 + (2 - 1)^2} &=& \sqrt{0^2 + 1^2} &=& \sqrt{0 + 1} &=& \sqrt{1} &=& 1\\
    ||x_5 - x_2|| &=& \sqrt{(2 - 1)^2 + (2 - 3)^2} &=& \sqrt{1^2 + (-1)^2} &=& \sqrt{1 + 1} &=& \sqrt{2}\\
    ||x_5 - x_3|| &=& \sqrt{(2 - 2)^2 + (2 - 5)^2} &=& \sqrt{0^2 + (-3)^2} &=& \sqrt{0 + 9} &=& \sqrt{9} &=& 3\\
    ||x_5 - x_4|| &=& \sqrt{(2 - 4)^2 + (2 - 3)^2} &=& \sqrt{(-2)^2 + (-1)^2} &=& \sqrt{4 + 1} &=& \sqrt{5}
\end{aligned}
$$

On prends la distance minimale puisque $k=1$. On trouve la distance $1$, associée au point $x_1$ de classe $C_1$. La classe de $x_5$ est donc ici $C_1$.

Même chose pour $x_6$ :

$$
\begin{aligned}
    ||x_6 - x_1|| &=& \sqrt{(2 - 2)^2 + (4 - 1)^2} &=& \sqrt{0^2 + 3^2} &=& \sqrt{0 + 9} &=& \sqrt{9} &=& 3\\
    ||x_6 - x_2|| &=& \sqrt{(2 - 1)^2 + (4 - 3)^2} &=& \sqrt{1^2 + 1^2} &=& \sqrt{1 + 1} &=& \sqrt{2}\\
    ||x_6 - x_3|| &=& \sqrt{(2 - 2)^2 + (4 - 5)^2} &=& \sqrt{0^2 + (-1)^2} &=& \sqrt{0 + 1} &=& \sqrt{1} &=& 1\\
    ||x_6 - x_4|| &=& \sqrt{(2 - 4)^2 + (4 - 3)^2} &=& \sqrt{(-2)^2 + 1^2} &=& \sqrt{4 + 1} &=& \sqrt{5}
\end{aligned}
$$

On prends la distance minimale puisque $k=1$. On trouve la distance $1$, associée au point $x_4$ de classe $C_2$. La classe de $x_6$ est donc ici $C_2$.

### Question 1.2)

> Déterminez la classe des points $x_5 = (2, 2)$ et $x_6 = (2, 4)$ par une méthode des k-plus proches voisins pour $k=1$

On reprends les résultats précédents. Cette fois-ci, comme $k=3$, on doit faire un vote majoritaire des trois points associés aux trois plus proches distances.

Pour $x_5$, les trois plus basses distances sont $1$ ($x_1)$, $\sqrt{2}$ ($x_2$) et $\sqrt{5}$ ($x_4$). Deux de ces points sont de classe $C_1$, un seul est de classe $C_2$. On affecte donc à $x_5$ la classe $C_1$.

Quant à $x_6$, ses trois plus basses distances sont $1$ ($x_3$), $\sqrt{2}$ ($x_2$) et $\sqrt{5}$ ($x_4$). Deux de ces points sont de classe $C_2$, un seul est de classe $C_1$. On affecte donc à $x_6$ la classe $C_2$.

### Question 1.3)

> Déterminez graphiquement la région du plan affecté à chaque classe pour une méthode des `k` plus proches voisins où $k=1$. En déduire la frontière de décision pour $k=1$.

<!-- TODO : ajouter des graphismes -->

### Question 1.4)

> Déterminez graphiquement la région du plan affecté à chaque classe pour une méthode des `k` plus proches voisins où $k=3$. En déduire la frontière de décision pour $k=3$.

## Classification Bayésienne

### Questions de Cours

#### Question 2.1)

> Rappelez la règle de Bayes.

La règle de Bayes est énoncée ainsi, avec $X$ et $Y$ deux événements :

$$
P(X|Y) = \frac{P(Y|X) \times P(X)}{P(Y)}
$$

#### Question 2.2)

> Comment démontrer la règle de Bayes à partir de la définition de la probabilité de l'intersection de deux évènements $P(X \cap Y)$ ?

$$
\begin{aligned}
    P(X \cap Y) &=& P(X|Y) \times P(Y)\\
                &=& P(Y|X) \times P(X)\\
                &\rightarrow& P(X|Y) \times P(Y) = P(Y|X) \times P(X)
\end{aligned}
$$

#### Question 2.3)

> Un classifieur bayésien est-il optimal et si oui par rapport à quel critère d'optimisation ?

Oui, un classifieur bayésien est toujours optimal par rapport à la probabilité d'erreur

#### Question 2.4)

> Rappelez la formule de calcul de la moyenne.

Soit $x$ l'ensemble de cardinal $n$ dont on cherche à calculer la moyenne :

$$
\overline{x} = \sum^n_{i=1} \frac{x_i}{n}
$$

Où, en minimisant le nombre de calculs :

$$
\overline{x} = \frac{1}{n} \sum^n_{i=1} x_i
$$

#### Question 2.5)

> Rappelez les deux formules de calcul de l'écart type.

Les deux formules sont :

$$
\sigma = \sqrt{\sum^n_{i=1} (x_i - \overline{x})^2}
$$

et :

$$
\sigma = \sqrt{\overline{x^2} -  \overline{x}^2}
$$

### Exercice I

#### Point-de-vue théorique

> On considère deux urnes $U_1$ et $U_2$ contenant :
>
> - Deux billes bleues et 1 bille rouge pour $U_1$
> - Deux billes rouges et 1 bille bleue pour $U_2$
>
> On choisit une bille selon le protocole suivant :
>
> 1. On lance une pièce non truquée
> 2. Si on obtient pile, on choisit une bille aléatoirement dans l'urne *U_1*
> 3. Si on obtient face, on choisit une bille aléatoirement dans l'urne *U_2*
>
> Le tirage des urnes est supposé uniforme. On considère les couples de variables aléatoires ($U$, $C$) avec $U$ l'urne choisie et $C$ la couleur de la bille. L'objectif est de prédire l'urne connaissant la couleur de la bille.

##### Question 2.6)

> Calculez les probabilités de tirage de l'urne : $P(U = U_1)$ et $P(U = U_2)$.

La pièce étant équilibrée et n'ayant que deux résultats possibles, on peut affirmer que :$$P(U = U_1) = P(U = U_2) = \frac{1}{2}$$.

##### Question 2.7)

> Calculez les probabilités que la couleur de la bille soit rouge connaissant le tirage de l'urne : $P(C = rouge|U = U_1)$ et $P(C = rouge|U = U_2)$.

De la composition des urnes, on peut déduire que :

$$
P(C = rouge|U = U_1) = \frac{2/3}
$$

$$
P(C = rouge|U = U_2) = \frac{1/3}
$$

##### Question 2.8)

> En déduire la probabilité que la couleur de la bille soit rouge $P(C = rouge)$.

$$
\begin{aligned}
    P(C = rouge) &= \frac{3}{6} + \frac{1}{2}\\
                 &= P(U_1)P(C = rouge|U_1) + P(U_")P(C = rouge|U_2)
\end{aligned}
$$

##### Question 2.9)

> Calculez les probabilités de l'urne connaissant la couleur de la bille : $P(U = U_1|C = rouge)$ et $P(U = U_2|C = bleu)$.

On a :

$$
P(U = U_1|C = rouge) = P(C = rouge | U = U_1) \times \frac{P(C = rouge)}{P(U_1)} = \frac{1}{3}
$$

Et :

$$
P(U = U_2|C = bleu) = P(C = bleu | U = U_2) \times \frac{P(C = bleu)}{P(U_2)} = \frac{2}{3}$$

##### Question 2.10)

> En déduire les réponses du meilleur classifieur au sens de la minimisation de la probabilité d'erreur du classifieur.

Le classifieur devrait affecter `rouge` à $U_1$ et `bleu` à $U_2$

##### Question 2.11)

> Calculez l'erreur du classifieur optimale

En utilisant la formule rappelée précédemment, on a :

$$
\frac{1}{3} \times \frac{1}{2} + \frac{1}{3} \times \frac{1}{2} = \frac{1}{3}
$$

#### Point-de-vue empirique

> On observe maintenant les tirages suivants en ne connaissant pas le mécanisme ayant permis de les réaliser :
> | Urne    |   1   |   1  |   2  |   1  |   2   |   2   |   1  |   2  |   1   |   1  |   1  |   2   |
> |:--------|:-----:|:----:|:----:|:----:|:-----:|:-----:|:----:|:----:|:-----:|:----:|:----:|:-----:|
> | Couleur | rouge | bleu | bleu | bleu | rouge | rouge | bleu | bleu | rouge | bleu | bleu | rouge |

##### Question 2.12)

> Estimez les lois $P(U = U_1)$ et $P(C = rouge).

On peut faire les estimations suivantes :

<!-- TODO : Améliorer les calculs de cette partie en les détaillant -->

$$
P(U = U_1) = \frac{7}{12}
$$

Et:

$$
P(U = U_2) = \frac{5}{12}
$$

##### Question 2.13)

> Estimez les lois $P(U = U_1|C = rouge)$ et $P(U = U_1|C = bleu)$.

Dans notre cas, on estime :

$$
P(U = U_1|C = rouge) = \frac{2}{5}
$$

Et :

$$
P(U = U_1|C = bleu)
$$

##### Question 2.15)

> Calculez l'erreur empirique du classifieur sur les données d'apprentissage.

L'erreur empirique est de $\frac{1}{3}$.

### Exercice 2 : Détection de Fraude

> Le but de cet exercice est de mettre en place un système de détection de tricheur.
>
> On dispose d'un dé à 6 faces parfaitement équilibré. On confie ce dé à des individus en leur demandant de procéder à un certain nombre de lancers et de faire part de leurs résultats. La population est composée :
>
> - De personnes honnêtes ($H$) qui font exactement ce qu'on leur demande,
> - De tricheurs aui à chaque fois au'on leur demande de lancer une fois un dé, exécute deux tirages et annoncent le plus grand des deux nombres obtenus.
>
> Ainsi, si on demande à un tricheur de lancer 5 fois le dé, il pourra obtenir la suite de résultats $2, 2, 5, 2, 4, 1, 5, 4, 6, 6$ et annoncer le résultat $2, 5, 4, 5, 6$.

#### Question 2.16)

> Calculez les probabilités $P(i|H)$ et $P(i|T)$ pour $i$ allant de 1 à 6.

On a, puisque le dé est parfaitement équilibré :

$$
\forall i, P(i|H) = \frac{1}{6}
$$

Et, puisque les tricheurs tirent deux fois :

$$
\forall i, P(i|T) = \frac{2i - 1}{36}
$$

#### Question 2.17)

> Calculez la probabilité de la séquence $2, 3, 4, 5, 6$ dans les deux cas : $P(23456|H)$et $P(23456|T)$ :

La probabilité dans le cas "honnête" est évidente puisque le dé est toujours équilibré et que la séquence est d'une longueur de 5 :

$$
P(23456|H) = \frac{1}{6^5} = \frac{1}{7776}
$$

Dans le cas tricheur, on applique des multiplications successives selon les probabilités trouvées précédemment :

$$
\begin{aligned}
    P(23456|T) &= \frac{3}{36} \times \frac{9}{36} \times \frac{7}{36} \times \frac{9}{36} \times \frac{11}{36}
               &= \frac{18711}{60466176}
\end{aligned}
$$

#### Question 2.18)

> On suppose que la population contient 30% de tricheurs. Que doit-on décider sur l'honnêteté d'un individu qui annonce 23456 si l'on suit :
>
> 1. La règle majoritaire $arg max_{y \in \{H, T\} P(y)}
> 2. La règle du maximum de vraisemblance $argmax_{y \in \{H, T\}} P(x|y)$
> 3. La règle de décision de Bayes $argmax_{y \in \{H, T\} P(y|x)}

<!-- TODO: A Compléter -->

### Exercice 3 : Jeu de Football

> On souhaite prévoir l'issue d'un match de football à partir des données avant match.
>
> | À domicile ? | Balance positive ? | Pluie ? | Match précédent gagné ? | Issue du match |
> |:------------:|:------------------:|:-------:|:-----------------------:|:--------------:|
> |       V      |          V         |    F    |            F            |        V       |
> |       F      |          F         |    V    |            V            |        V       |
> |       V      |          V         |    V    |            F            |        V       |
> |       V      |          V         |    F    |            V            |        V       |
> |       F      |          V         |    V    |            V            |        F       |
> |       F      |          F         |    V    |            F            |        F       |
> |       V      |          F         |    F    |            V            |        F       |

#### Question 2.19)

> Estimez les probabilités de victoire et de défaite de cette équipe.

On retrouve ces probabilités par lecture du tableau (colonne `issue du macth` : $P(V) = \frac{4}{7}$ et $P(F) = \frac{3}{7}$.

#### Question 2.20)

> Calculez la probabilité d'une des colonnes du tableau sachant la survenue ou non de la victoire $\forall i P(x_i = V|V), P(x_i = V|F)$.

<!-- TODO : Détailler et expliquer -->

|          |       0       |       1       |       2       |       3       |
|:---------|:-------------:|:-------------:|:-------------:|:-------------:|
| Victoire | $\frac{3}{4}$ | $\frac{3}{4}$ | $\frac{2}{4}$ | $\frac{2}{4}$ |
| Défaite  | $\frac{1}{3}$ | $\frac{1}{3}$ | $\frac{2}{3}$ | $\frac{2}{3}$ |

#### Question 2.21)

> En supposant que chaque attribut est indépendant conditionnellement à chaque classe, classer l'élément ($V$, $F$, $V$, $F$).

$$
P(Résultat = V | V, F, V, F) \\
P(V, F, V, F | Résultat = V) \times \frac{P(V)}{P(V, F, V, F)} \\
P(V, F, V, F | Résultat = V) \times \frac{\frac{4}{7}}{P(V, F, V, F)} \\
. \\
. \\
. \\
P(Victoire) = 0.02679
$$

Il s'agit plutôt d'une victoire.
