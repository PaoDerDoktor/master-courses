# Complexité et Calculabilité - TD1 : Cardinalité et machines de Turing

> Rappel : soient $A$ et $B$ deux ensembles, une fonction $f : A \rightarrow B$ est
>
> — **Injective** ssi $\forall a, a′ \in A : f(a) = f(a′) \Rightarrow a = a′$ (ou la contraposée),
> — **Surjective** ssi $\forall b \in B : \exists a \in A : b = f(a),
> — **Bijective** ssi elle est à la fois *injective* et *surjective*.
>
> Utile : **Théorème de Cantor-Schröder-Bernstein** : soient $A$ et $B$ deux ensembles, si il existe une fonction injective de $A$ vers $B$ (intuitivement $|A| \leqslant |B|$), et une fonction injective de $B$ vers $A$ (intuitivement $|B| \leqslant |A|$), alors *il existe une bijection* entre $A$ et $B$ (intuitivement $|A| = |B|$).

## Exercice 1. Ensembles infinis dénombrables

### Question 1.1)

> Donner une bijection entre $N = \{0, 1, 2, ...\}$ et $2N = \{0, 2, 4, ...\}$.

$$
f: n \rightarrow 2n
$$

### Question 1.2)

> Donner une bijection entre $N = \{0, 1, 2, ...\}$ et $Z = \{..., −2, −1, 0, 1, 2, ...\}$.

$$
\begin{aligned}
f : n \rightarrow &| n/2 pour n pair\\
                  &| - \fract{n+1}{2} pour n impair
\end{aligned}
$$

### Question 1.3)

> Prouver l’existence d’une bijection entre $N$ et $N × N$.

$$
N \rightarrow NxN
    (a,b)
$$

$$
f: n \rightarrow (n,n) |N| \leqslant |N|x|N|
$$

> Bonus : si vous êtes très fort, donnez en une.

$$
NxN \rightarrow N
$$

$$
F : (a,b) \rightarrow 2^a \times 3^b
$$

### Question 1.4)

> Peut-on en déduire que $|Q| = |N|$ ? Et que $|N| <= Q|$ ?

$$
a \in Z
b \in N  \{O\}
|Q| <= |Z \times N| = |N \times N| = |N|
$$

Donc $|Q| = |N|$

### Question 1.5)

> En utilisant la bijection $g$ entre $N$ et $N × N$, donner une bijection entre $N$ et $N × N × N$.

$$
\begin{aligned}
    g :& N \rightarrow N \times N \\
    f :& N \rightarrow N \times N \times N \\
       &  n \rightarrow g(a), b
\end{aligned}
$$

### Question 1.6)

> Prouver l’existence d’une bijection entre $\Sigma^*$ et $N$, pour $\Sigma$ un alphabet fini.

$$
|N| \leqslant |\Sigma^*|
$$
$$
\begin{aligned}
    F :& n \rightarrow \text{$n$ en binaire} \\
    a =& |\Sigma| \\
    \Sigma =& \{1, 2, 3, ..., a\} \\
    \Sigma^* \rightarrow& N \\
    F : w_e, w_{e-1}, ..., w_0 \rightarrow& \sum^{e}_{i = 0}{w_i \times q^i}
\end{aligned}
$$

### Question 1.7)

> Conclure en donnant la relation de grandeur entre l’ensemble des algorithmes et l’ensemble $N$

$$
|\text{L'ensemble des algorithmes}| = |N|
$$

## Exercice 2. Ensembles infinis indénombrables

### Question 2.1)

> Donner la relation de grandeur entre l’ensemble des problèmes et l’ensemble des problèmes de décision.

$$
\{\text{Ensemble des problèmes de décision}\} \subset \{\text{ensemble des problèmes}\}
$$

$$
F : N \rightarrow N \\
g : N x N \rightarrow \{0, 1\} \\
g(x, y) = T \text{ ssi } f(x) = y
$$

### Question 2.2)

> Donner la relation de grandeur entre l’ensemble des problèmes de décision et l’ensemble des fonctions $f : N → \{0, 1\}$.

$$
|\text{ensemble problème décision}| = |\{F : N -> \{0, 1\}\}|
$$

### Question 2.3)

> Prouver l’existence d’une bijection entre l’ensemble des fonctions $f : N → \{0, 1\}$ et $[0, 1]$.
> Astuce : Utiliser la base 2.
> Remarque : 0.1111... = 1

<!-- FIXME : À corriger et compléter -->

$R = \{N, ., a_1, a_2, a_3, ...\}$ avec $N \rightarrow \text{code en binaire}$, $a_x \rightarrow {0,1}$

$$
\begin{aligned}
    g : N \rightarrow& {0, 1} \\
    F \rightarrow& 0.
\end{aligned}
$$

### Question 2.4)

> Prouver l’existence d’une bijection entre $[0, 1]$ et $R$.

<!-- FIXME : À revérifier -->

$$
[0, 1] \leqslant R
f : a_1, a_2, ..., a_e.b_1, b_2, ... \rightarrow a_1 0 a_2 0... . b_1 1 b_2 1
$$

### Question 2.5)

> Conclure sur la relation de grandeur entre $R$ et l’ensemble des problèmes

$$
|\text{L'ensemble des problèmes}| = |R|
$$

## Exercice 3. Fonctions non calculables

### Question 3.1)

> Rappeler la relation de grandeur entre l’ensemble $R$ et l’ensemble $N$. (Montrer que $N \subseteq R$ et rappeler en quelques phrases l’argument de la diagonale de Cantor).

Supposons par l'absurde que $|N| = |R|$

Donc on peut dire que chaque réel a un numéro $n_i$ avec $i \in N$.

<!-- FIXME : À revérifier -->

$$
\pi n_1 4 1 6 \\
\frac{1}{3} n_2 3 3 3 3 \\
\frac{2}{3} n_3 6 6 6 6 \\
5 n_4 0 0 0 0
$$

On prend chaque digit en diagonale. $L1 \text{ nb } 1$, $ligne 2 \text{ nb } 2$, ...
$$
\begin{aligned}
    np =& 0. 1 3 6 0 \\
        & 0. 2 4 7 1
\end{aligned}
$$

Le $p^{ième}$ digit de $np = p^{ième} \text{digit de np} + 1$

C'est une contradiction donc $|N| \neq |R|$

### Question 3.2)

> Donner la relation de grandeur entre l’ensemble des problèmes et l’ensemble des algorithmes.

$$
|\text{Ensemble des problèmes}| \gt |\text{Ensemble des algorithmes}|
$$

### Question 3.3)

> Conclure sur l’existence de fonctions non calculables.

Il y a moins d'algorithmes que de problèmes donc il y a des problèmes sans algos et donc des fonctions non calculables.

## Exercice 4 - Ma première Machine de Turing

> Soit $M = (Q, \Gamma, \Sigma, \delta, q_0, B, q_F )$ la machine de Turing où :
>
> — $Q = {q_0, q_1, q_2, q_3, q_4, q_5, q_F }$,
> — $\Sigma = {a, i, l, n, p, s}$, $\Gamma = {a, i, l, n, p, s, B}$,
> — $\delta$ est donnée par :

<!-- TODO: Ajouter un graphe d'automate -->

### Question 4.1)

> Quel est le langage reconnu par cette machine de Turing ?

$L(M) = {sapin,lapin}$

### Question 4.2)

> Peut-on dire que ce langage est semi-décidable ?

Oui, car il est reconnu par $M$.

### Question 4.3)

> Peut-on dire que ce langage est décidable ?

Oui, puisqu'il n'y a pas de boucles et qu'en 6 étapes maximum c'est fini

### Question bonus

<!-- TODO : À compléter-->

> Est-il co semi decidable

Oui

## Exercice 5 - États d’une Machine de Turing = mémoire finie

> Objectif : voir que l’on peut sauvegarder des informations (en quantité finie) dans les états.
> Soit $M = (Q, \Gamma, \Sigma, \delta, q_0, B, q_F)$ la machine de Turing où :
>
> — $Q = {q_0, q_a, q_b, q_a', q_b', q_F }$,
> — $\Sigma = {a, b}$, $\Gamma = {a, b, B}$,
> — $\delta$ est donnée par :
>
> $(q_0, a) \mapsto (q_a, a, \rightarrow) (q_0, b) \mapsto (q_b, b, \rightarrow)$
> $(q_a, a) \mapsto (q_a, a, \rightarrow) (q_b, a) \mapsto (q_b, a, \rightarrow)$
> $(q_a, b) \mapsto (q_a, b, \rightarrow) (q_b, b) \mapsto (q_b, b, \rightarrow)$
> $(q_a, B) \mapsto (q_a', B, \leftarrow) (q_b, B) \mapsto (q_b', B, \leftarrow)$
> $(q_a', a) \mapsto (q_F , a, \rightarrow) (q_b', b) \mapsto (q_F , b, \rightarrow)$

### Question 5.1)

> Dessiner cette machine sous la forme d’un automate.

<!-- TODO : À faire -->

### Question 5.2)

> Quel est le langage reconnu par cette machine de Turing ?

Il reconnaît les mots $w \in {a, b}^*$ qui ont la même lettre en première et dernière position.

### Question 5.3)

> Peut-on dire que ce langage est semi-décidable ?

### Question 5.4)

> Peut-on dire que ce langage est décidable ?

## Exercice 6. MT

> Donner des machines de Turing pour décider les langages suivants.

### Question 6.1)

> $L = {aw | w \in \Sigma^∗}$ avec $\Sigma = {a, b, c}$.

### Question 6.2)

> $L = {w \in \Sigma^∗ | |w| \equiv 0 \mod 3}$ avec $\Sigma = {a}$.

### Question 6.3)

> $L = {w \in \Sigma^* | w \text{ est un palindrome}}$ avec $\Sigma = {a, b}$.

### Question 6.4)

> $L = {a^n b^n c^n | n \in N}$ avec $\Sigma = {a, b, c}$.

### Question 6.5)

> $L = {a^n b^{\frac{n}{2}} | n \in N}$ avec $\Sigma = {a, b}$.

### Question 6.6)

> $L = \{w\#w′ | w, w′ \in {0, 1}^∗ \text{ et } w′ = w + 1\}$ avec $\Sigma = \{0, 1, \#\}$.

### Question 6.7)

> Ces langages sont-ils semi-décidables ? décidables ?
