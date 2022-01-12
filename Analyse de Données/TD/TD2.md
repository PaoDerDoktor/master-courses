# Analyse de Données - TD2 : Mathématiques pour l'analyse de données

## Pour se mettre en jambe

> On considère deux points `A` et `B` dans un repère orthonormé, ``A (-3; -2)`` et ``B(5; 4)``. Calculez la distance AB.

La distance euclidienne AB est : $\sqrt{(x_A - x_B)^2 + (y_A - y_B)^} = \sqrt{(-3-5)^2 + (-2-4)^2} = \sqrt{(-8)^2 + (-6)^2} = \sqrt{64 + 36} = \sqrt{100} = 10$

## Exercice I : Produit Matriciel

> On considère es matrices $A$ et $P$ définies par :
>
> $$
> A =
> \begin{matrix}
> 1 & -3 & 3 \\
> 3 & -5 & 3 \\
> 6 & -6 & 4
> \end{matrix}
> $$
>
> $$
> P =
> \begin{matrix}
> 1 &  1 & 1 \\
> 1 &  0 & 1 \\
> 0 & -1 & 2
> \end{matrix}
> $$

### Question I.1)

> Calculez le déterminant de P. Est-elle inversible ?

On prends la deuxième ligne puisqu'elle ne contient que des `1` et un `0` :

<!-- FIXME: Détailler le calcul -->

$$
det(P) = -2
$$

$P$ est donc bien inversible puisque son déterminant est différent de 0

### Question I.2)

> Si oui, calculer $P^{-1}$

Puisque $P$ est inversible, on peut calculer $P^{-1}$.

L'idée est de transformer P en la matrice identité avec la technique du **pivot de Gauss**

<!-- FIXME: Reprendre ou Refaire. J'arrive pas à suivre le prof et toutes ses erreurs -->

### Question I.3)

> Calculer le produit $P^{-1}AP$. On note $D$ le résultat

On a le calcul suivant :

$$
\begin{align}
    D =&
    \begin{bmatrix}
        -\frac{1}{2} &  \frac{3}{2} & -\frac{1}{2} \\
         1           & -1          &  0           \\
         \frac{1}{2} & -\frac{1}{2} &  \frac{1}{2}
    \end{bmatrix} \times
    \begin{bmatrix}
        1 & -3 & 3 \\
        3 & -5 & 3 \\
        6 & -6 & 4
    \end{bmatrix} \times
    \begin{bmatrix}
        1 &  1 & 1 \\
        1 &  0 & 0 \\
        0 & -1 & 2
    \end{bmatrix}\\
      =&
    \begin{bmatrix}
         1 & -3 & 1 \\
        -2 &  2 & 0 \\
         2 & -2 & 2
    \end{bmatrix} \times
    \begin{bmatrix}
        1 &  1 & 1 \\
        1 &  0 & 0 \\
        0 & -1 & 2
    \end{bmatrix} \\
      =&
    \begin{bmatrix}
        -2 &  0 & 0 \\
         0 & -2 & 0 \\
         0 &  0 & 4
    \end{bmatrix}
\end{align}
$$

### Question I.4)

> Calculer $D^n$

<!-- À faire, malheureusement pas eu le temps de copier -->

## Exercice II : Vecteurs propres et valeurs propres

### Question II.1)

> Déterminez les valeurs propres et les vecteurs propres de la matrice $A$ suivante :
>
> $$
> A =
> \begin{bmatrix}
> 6 & 3 \\
> 1 & 4
> \end{bmatrix}
> $$

On commence par calculer $A - \lambda I_2$ :

$$
A - \lambda I_2 =
\begin{bmatrix}
    6 - \lambda & 3 \\
    1           & 4 - \lambda
\end{bmatrix}
$$

On cherche alors le déterminant :

$$
\begin{align}
    det(A - \lambda I_2) =& (6 - \lambda)(4 - \lambda) - 3
                         =& \lambda^2 - 10 \lambda + 21
\end{align}
$$

On obtient sans surprise un polynôme du second degré. Calculons sont discriminant : $\Delta = (-10)^2 - 4 \times 1 \times 21 = 100 - 4 \times 21 = 100 - 84 = 16$.

Calculons maintenant ses racines :

$$
\lambda_1 = \frac{-(-10) - \sqrt(16)}{2 \times 1} = \frac{10 - 4}{2} = \frac{6}{2} = 3\\
\lambda_2 = \frac{-(-10) + \sqrt(16)}{2 \times 1} = \frac{10 + 4}{2} = \frac{14}{2} = 7
$$

On a obtenu $\lambda_1$ et $\lambda_2$, valeurs propres de $A$.

On va maintenant un vecteur propre associé à chaque valeur propre, en commençant par $\lambda_1$

$$
\begin{cases}
    3x +& 3y =& 0 \\
     x +&  y =& 0
\end{cases} \Rightarrow
\begin{cases}
    x = y
\end{cases}
$$

<!-- TODO: À reprendre la prochaine fois ! ^^ -->