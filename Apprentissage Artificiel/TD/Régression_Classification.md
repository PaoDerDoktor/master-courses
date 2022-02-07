# TD 2 : Régression - Classification

## Exercice 1 : Régression linéaire

> Un test de lecture a été réalisé sur 12 enfants de 7 à 9 ans dont les notes ont été les suivantes :
>
> |       |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 | 10 | 11 | 12 |
> |:------|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
> | âges  |  7 |  8 |  9 |  7 |  9 |  8 |  7 |  9 |  8 |  9 |  8 |  7 |
> | notes | 12 | 16 | 16 | 14 | 18 | 18 | 12 | 18 | 14 | 16 | 18 | 14 |

### Question 1.1)

> Tracez les notes en fonction de l'âge

<!-- FIXME : Ajouter un graphe -->

### Question 1.2)

> Calculez les moyennes et la matrice de covariance des données

La moyenne de l'âge, $\overline{x}$, est de $8$ ($\overline{x} = \frac{7 \times 4 + 8 \times 4 + 9 \times 4}{12} = \frac{24}{3} = 8$).

La moyenne des notes, $\overline{y}$, est de $15.5$ ($\overline{y} = 15.5$).

La matrice des covariances est calculée :

$$
\begin{bmatrix}
    \text{variance}_x        & \text{covariance}_{x, y} \\
    \text{covariance}_{y, x} & \text{variance}_y
\end{bmatrix}
$$

On effectue donc les calculs nécessaires :

$$
\begin{align}
    \text{variance}_x =& \frac{1}{n} \sum x^2 - (\frac{1}{n} \sum x)^2 \\
                      =& \frac{1}{n} \sum (x - \overline(x))^2 \\
                      =& \frac{8}{12} = \frac{2}{3}
\end{align}
$$

$$
\begin{align}
    \text{variance}_y =& \frac{1}{n} \sum y^2 - (\frac{1}{n} \sum y)^2 \\
                      =& \frac{1}{n} \sum (y - \overline(y))^2 \\
                      =& \frac{19}{4}
\end{align}
$$

$$
\begin{align}
    \text{covariance}_{x, y} =& \frac{1}{n} \sum (x - \overline{x})(y - \overline{y}) \\
    \text{covariance}_{x, y} =& \text{covariance}_{y, x} \\
                             =& \frac{4}{3} 
\end{align}
$$

On obtient donc cette matrice :

$$
\begin{bmatrix}
    \frac{2}{3} & \frac{ 4}{3} \\
    \frac{4}{3} & \frac{19}{4}
\end{bmatrix}
$$

### Question 1.3)

> Déduisez de l'équation précédente la droite passant le plus proche possible des données, puis tracez-la

On cherche d'abord la valeur optimale de $\theta_1$ :

$$
\theta_1 = \frac{\frac{4}{3}}{\frac{2}{3}} = 2
$$

On déduit la valeur optimale de $\theta_0$ :

$$
\begin{align}
    \theta_0 =& \overline{y} - \theta_1 \overline{x}
             =& 15.5 - 2 \times 8 = - 0.5
\end{align}
$$

On obtient donc la regression $y = -0.5x + 2$

<!-- FIXME : Ajouter un graphe -->

## Exercice 2 : Descente de gradient

> Nous voulons faire une regression par descente de gradient sur les données suivantes :

### Question 2.1)

> Calculez la valeur de la fonction de coût pour le critère par moindre carré dans le cas d'une régression de type $y = ax$ pour les droites suivantes :
>
> - a) $y = x$
> - b) $y = 0.5x$
> - c) $y = 0.25x$

On a :

- Pour $y = x$ :
    $$
        \begin{align}
            J(x) =& \frac{1}{3}((0.5 - 1)^2 + (1 - 2)^2 + (1.5 - 3)^2) \\
                     =& \frac{0.25 + 1 + 2.25}{3} \\
                     =& \frac{7}{6} = 1.17
        \end{align}
    $$
- Pour $y = 0.5x$ :
    $$
        \begin{align}
            J(0.5x) =& \frac{1}{3}((0.5 - 0.5)^2 + (1 - 1)^2 + (1.5 - 1.5)^2) \\
                     =& \frac{0}{3} \\
                     =& 0
        \end{align}
    $$
- Pour $y = 0.25x$ :
    $$
        \begin{align}
            J(0.25x) =& \frac{1}{3}((0.5 - 0.25)^2 + (1 - 0.5)^2 + (1.5 - 0,75)^2) \\
                     =& \frac{0.25 + 0.5 + 0,75}{3} \\
                     =& \frac{1}{2} = 0.5
        \end{align}
    $$

La droite la plus proche est $y = 0.5x$, parfaite puisque de fonction de coût égale à 0.

### Question 2.2)

> Tracez à partir des points précédents la fonction de coût $J(a)$ du problème de régression

<!-- FIXME : Ajouter un graphe -->

### Question 2.3)

> Calculez les 3 première itérations d'une descente de gradient en partant de la droite $y = 1 \cdot x$ pour un taux d'apprentissage de $\alpha = 0.1$. Tracez la descente sur la figure précédente.

<!-- FIXME : Recopie exacte du tableau, à détailler et rendre plus clair et joli -->

$$
\begin{align}
    \alpha =& ~ 0.1 \\
    a \leftarrow& ~ 0.1 \\
    a \leftarrow& ~ a - \alpha \frac{\partial J(a)}{\partial a} \\
               =& ~ \frac{\frac{1}{3}((0.5 - a)^2 + (1 - 2a)^2 + (1.5 - 3a)^2)}{\partial a} \\
               =& ~ \frac{1}{3} (-a + 2a - 4 + 4a - 9 + 18a) \\
               =& ~\frac{1}{3} (24a - 14)
\end{align}
$$

### Question 2.4)

> Calculez la solution analytique du problème de régression. Trouvez-vous la même solution que par descente de gradient ?

### Question 2.5)

> Nous allons effectuer des descentes de gradients avec d'autres valeurs de $\alpha$ :
>
> - $\alpha = 0.3$
> - $\alpha = 0.01$
>
> Que constatez-vous ? Calculez et tracer la valeur de la fonction de coût au cours des itérations et expliquer son comportement.

## Exercice 3 : Régression polynomiale

> lors du lancement d'une balle nous avons mesuré l'altitude de la balle en fonction du temps. On obtient les valeurs suivantes :
>
> |          |   |    |   |
> |:---------|:-:|:--:|:-:|
> | ``t[s]`` | 0 |  3 | 4 |
> | ``h[m]`` | 1 | 13 | 9 |

### Question 3.1)

> On suppose que l'on peut approximer cette fonction par un polynôme de degré 2. Calculez les coefficients de ce polynôme.
>
> *Rappel :*
> $$
> \begin{align}
> X^{-1} =&
> \begin{Bmatrix}
> a & b & c \\
> d & e & f \\
> g & h & i
> \end{Bmatrix}^{-1} \\
> =& \frac{1}{det(X)}
> \begin{Bmatrix}
> ei-fg & ch-bi & bf-ce \\
> fg-di & ai-cg & cd-af \\
> dh-eg & bg-ah & ae-bd
> \end{Bmatrix}
> \end{align}
> $$
>
> *Avec :*
>
> $$
> det(X) = aei + bfg + cdh - ceg -fha -ibd
> $$

### Question 3.2)

> Déduisez de la question précédente l'instant $\overline{t}$ où la balle atteint l'altitude maximale.

## Exercice 4 : Démonstration

### Question 4.1)

> Rappelez la formule du problème de régression d'arrête.

### Question 4.2)

> Donnez la solution analytique de la question précédente et faites la démonstration de votre résultat.
