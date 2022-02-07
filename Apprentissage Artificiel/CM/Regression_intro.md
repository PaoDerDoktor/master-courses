# Apprentissage Artificiel - Introduction à la Regression

## Exemple d'utilisation de la regression

Une régression sert à prédire une valeur cible `y` à partir d'une valeur en entrée `x`. Ainsi, une régression est représentable par une courbe sur un graphique.

Plus spécifiquement, l'idée est de créer une courbe de régression à partir d'observations (des entrées `x` ayant des sorties `y` connues)

On peut utiliser une regression pour beaucoup de choses, par exemple pour prévoir une température d'ébullition, une tendance, des trajectoires...

## Exemple introductif

On cherche à prédire le prix de maisons en milliers de dollars à Portland en fonction de leurs surfaces en pied carrés.

Notre ensemble de `M` de `m` observations de descripteur `x` (surface) et de valeur `y` (prix) est constitué de ventes immobilières à Portland. Ainsi, on recherche un algorithme nous permettant de calculer la courbe de régression associée à ces observations.

Si on cherche une régression **linéaire**, on peut trouver cette courbe ainsi : $y = \theta_0 + \theta_1 \times x$. On obtient ainsi une équation représentant n'importe quelle droite de l'espace. on cherche alors à trouver celle qui passera le plus proche possible de tous les points. Pour cela, on utilise le critère de moindre carré :

- On mesure l'erreur de prédiction en terme de moyennes des distances aux carrés : $J(y, ỹ) = ||y - ỹ||^2$. avec $y$ la valeur observée et $ỹ$ la valeur lue sur la courbe au même `x`; pour chacune des observations de `M`
- On cherche donc $\theta_0$ et $\theta_1$ tels que la somme de ces distances soient minimales.

On appelle la fonction permettant d'optimiser la courbe sa **fonction de coût**. Il en existent d'autres ayant d'autres intérêts, avantages et inconvénients. Elle a pour de calculer un algorithme de regression. On peut simplifier le calcul en fixant l'un ou l'autre des $\theta$.

### Minimisation de la fonction de coût dans le cas simplifié

On pose $J(\theta_1)$ la fonction de coût calculant des regressions en ne variant que $\theta_1$ :

$$
J(\theta_&) = \frac{1}{m}\sum^m_{i=1} (y_i - \theta_1 x_i)^2
$$

On cherche donc :

$$
argmin_{\theta_1} J(\theta_1)
$$

Puisque J est une fonction convexe d'ordre 1, on sait que son minimum est l'endroit où sa dérivée s'annule en 1. On peut alors directement récupérer le $\theta$ donnant la regression la plus proche des observations

<!-- TODO : Ajouter la dérivée

moy(xy)
--------
moy(x*x)

-->

On peut aussi rechercher une fonction de coût ne variant que $\theta_0$.

## Exemple introductif - poursuite

On cherche pour notre exemple une fonction de coût la plus précise possible, variant donc les deux $\theta$ :

$$
argmin_{\theta_0, \theta_1} J(\theta_0, \theta_1) = argmin_{\theta_0,\theta_1} \frac{1}{m} \sum^m_{i=1} (y_i - \theta_0 - \theta_1 x_i)^2
$$

Puisqu'on a deux variables ($\theta_0$ et $\theta_1$), on effectue des dérivées partielles.

La dérivée partielle de $J$ suivant $\theta_0$ donne :

<!-- FIXME : Verifier -->

$$
\begin{aligned}
    \frac{\partial J(\theta_0, \theta_1)}{\partial \theta_0} &= \frac{\partial}{\partial \theta_0} \sum^m_{i=0} (y_i - \theta_0 - \theta_1 x_i)\\
    &= \sum^m_{i=0} \frac{\partial}{\partial \theta_0} (y_i - \theta_0 - \theta_1 x_i)\\
    &= \sum^m_{i=0} 2(y_i - \theta_0 - \theta_1 x_i) \times (-1) &= 0\\
    &= \sum^m_{i=0} 2(y_i - \theta_0 - \theta_1 x_i) &= 0
\end{aligned}
$$

Le même calcul avec $\theta_1$ donne le même résultat.

Ce calcul des dérivées suivant les $\theta$ permet d'obtenir des conditions d'optimalité, dans lesquelles l'erreur moyenne est nulle.

On calcule alors les $\theta$, en commençant par $\theta_0$ :

<!-- TODO : A COMPLETER -->

$$
\begin{aligned}
    \sum^m_{i=0} (y_i - \theta_0 - \theta_1 x_i) x_i = 0 &\rightarrow \sum^m_{i=0} (y_i - (\bar{y} - \theta_1 \bar{x}) - \theta_1 x_i)x_i = 0 \\
     &\rightarrow \sum^m_{i=0} (y_i - \bar{y} - \theta_1 (-\bar{x} + x_i))x_i = 0 \\
     &\rightarrow \frac{1/m \sum^m_{i=0} (y_i)}{xxx}
\end{aligned}
$$

On obtient alors la regression optimale pour notre cas !

## Méthode de résolution alternative (cas simplifié) : la descente de gradient

On peut atteindre le minimum dune courbe en se dirigeant pas-à-pas dans la direction de la plus forte pente.

Pour connaître le direction de la pente, on regarde la dérivée : si celle-ci est positive en notre point, alors notre pente monte et on va donc vers la direction opposée(en 1D, on se déplace sur la gauche). Si la dérivée est négative; on la suis puisqu'elle descends (en 1D, on se déplace sur la droite).

L'idée de la descente de gradient est donc d'utiliser méthode sur des conditions d'optimalité comme faites dans l'exemple introductif pour trouver la meilleure regression possible.

<!-- TODO : Ajouter la visualisation de $\alpha$ de google -->

Il est important de choisir un pas $\alpha$ de bon calibre : trop grand, la descente de gradient manquera la solution et divergera. Trop petit, et le calcule sera trop long.

## Extension du problème à plusieurs paramètres

<!-- TODO: Compléter -->

Une regression linéaire peut avoir plusieurs paramètres. Dans ce cas on pose $d$ le nombre de variables, $x$ un vecteur colonne contenant chaque $x^{(1)}, x^{(2)}, ..., x^{(d)}$ et $\theta$ un vecteur colonne contenant chaque $\theta^{(1)}, \theta^{(2)}, ..., \theta^{(d)}$. On peut ajouter $\theta_0$ dans $\theta$ si on ajoute xxxx

## Exemple de régression non-linéaire

**L'idée :** en réécrivant le problème à l'aide de *l'aire* $X_s= X_l X_L$, on retrouve un problème linéaire de type $y = \theta_0 + \theta_1 X.

Dans tous les cas, on essaie de se ramener à des cas linéaires. On réécris les problèmes pour se retrouver à nouveau dans le cas linéaire, c'est toujours faisable.

Mettons-nous dans un cadre où notre regression est quadratique : $y = \theta_0 + \theta_1 x + \theta_2 x^2$.

On peut réécrire :

$$
y = \theta_0 + \theta_1 x + \theta_2 x^2 \rightarrow y = \theta_0 x^{(0)} + \theta_1 x^{(1)} + \theta_2 x^{(2)}
$$

On a donc :

$$
x =
\begin{Bmatrix}
    1 \\ x \\ x^2
\end{Bmatrix}
$$

Si on se met dans un cadre où cette regression est cubique : $y = \theta_0 + \theta_1 x + \theta_2 x^2 + \theta_3 x^3$.

On peut réécrire :

$$
y = \theta_0 + \theta_1 x + \theta_2 x^2 + \theta_3 x^3 \rightarrow y = \theta_0 x^{(0)} + \theta_1 x^{(1)} + \theta_2 x^{(2)} + \theta_3 x^{(3)}
$$

On a donc :

$$
x =
\begin{Bmatrix}
    1 \\ x \\ x^2 \\ x^3
\end{Bmatrix}
$$

On peut imaginer ce système avec n'importe quel famille de fonctions.

<!-- TODO : Ajouter une partie plus complète et détaillée sur les différentes familles de fonctions -->
