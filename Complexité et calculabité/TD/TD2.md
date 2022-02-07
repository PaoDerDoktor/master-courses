# TD 02 - Machines de Turing et codage

## Exercice 1

> Donner le code $\langle M \rangle$ de la machine de turing $M = (Q, \Sigma, \Gamma, \delta, q_0, B, q_F)$ d'esemble d'états $Q ={q_0, q_1, q_F}$, d'alphabet $\Sigma = \{0, 1\}$ et $\Gamma = \{0, 1, B\}$, et dont la fonction de transition est donnée par :
>
> | $\delta$ |            0            |             1           |           B            |
> |:---------|------------------------:|------------------------:|-----------------------:|
> |   $q_0$  | $(q_1, 1, \rightarrow)$ |             -           |           -            |
> |          |            -            | $(q_1, 0, \rightarrow)$ | $(q_F, B, \leftarrow)$ |

On retrouve la chaîne binaire suivante selon le codage vu en cours : ``0001100011010100100100110010010010100110010001000100010``. On peut séparer cette chaîne ainsi :

```turingCode
    --- DÉFINITION DES DONNÉES DE LA MACHINE ---
000 => n = |R|
11
000 => m = |Γ|
11  --- DÉFINITION DES TRANSITIONS ---
    0   => q_0
    1
    0   => 0
    1
    00  => q_1
    1
    00  => 1
    1
    00  => ->
11 -- Transition suivante (2)
    00  => q_1
    1
    00  => 1
    1
    00  => q_1
    1
    0   => 0
    1
    00  => ->
11  --- Transition suivante (3)
    00  => q_1
    1
    000 => B
    1
    000 => q_F
    1
    000 => B
    1
    0   => <-
```

<!-- TODO: Insérer un graphe de la machine -->

Il s'agit d'une machine qui va toujours vers la droite jusqu'à son arrêt (où elle recule)

<!-- TODO : Insérer un graphe de la machine-->

## Exercice 2

### Question 2.1)

> Indiquer si l'énoncé suivant est vrai, en justifiant.
>
> $\nexists M_{\text{halt}}, \forall M, \forall w : M_{\text{halt}}(\langle M \rangle, w) = \text{halt}(\langle M \rangle w)$

Vrai, c'est le théorème de l'arrêt (*halt theorem*)

### Question 2.2)

> Indiquer si l'énoncé suivant est vrai, en justifiant.
>
> $\forall M, \forall w, \nexists M_{\text{halt}}: M_{\text{halt}}(\langle M \rangle, w) = \text{halt}(\langle M \rangle w)$

Faux, on prend :

- Une machine $M_\forall$ qui accepte tous les mots.
- Une machine $M_{\text{halt}}$ qui accepte toutes les entrées

## Exercice 3

> Supposons qu'une machine de Turing s'arrête au bout de $t$ étapes de calcul en visitant (possiblement plusieurs fois chacune) $s$ cases du ruban. Quelle(s) relation(s) existe(nt) entre $t$ et $s$ ?

On a $s \leqslant t$ et, si $t \geqslant 2$, $s \geqslant 2$

## Exercice 4

> On définit une fonction de codage $\text{code}_1$ des couples d'entiers de la manière suivante : étant donnés deux entiers $x$ et $y$, on pose :
>
> $$
> \text{code}_1(x, y) = x_1 0 x_2 0 ... x_{n-1} 0 x_n 1 y_1 y_2 ... y_m
> $$
>
> Où $x_1 x_2 ... x_n$ et $y_1 y_2 ... y_n$ sont les représentations binaires respectives de $x$ et $y$.

### Question 4.1)

> Ce codage est-il injectif (Autrement dit, un tel code correspond-il bien à un unique couple d'entiers) ?

Le codage est bien injectif. Soit :

$$
\text{code}_1 (x, y) = a_1 a_{\alpha}
$$

On sait que $| \alpha | = n = min \{i | a_{2i} = 1 \}$

Donc on a :

$$
\begin{align}
    x =& (a_{2i+1})_{i \in [0, n[} \\
    y =& (a_i)_{i \in [2n+1, \alpha ]}
\end{align}
$$

<!-- Pour la colorisation des parenthèses : ]] -->

### Question 4.2)

> Donnez le codage du couple ``(10, 5)``.

Le codage du couple donne ``10001001101``.

### Question 4.3)

> Quel est le couple associé au codage ``100010100010111001110`` ?

On remarque que l'index 14 est le premier index pair possédant un `1`. On en conclut que le premier chiffre du couple est codé ``10001010001011``, soit ``1011011`` (= `91`), et que le second est ``1001110`` (= `78`).

On retrouve alors le couple est ``(91, 78)``.

### Question 4.4)

> Quel est le nombre de bits utilisés pour coder un couple $(x, y)$ ?

Le nombre de bits utiliser pour coder le couple $(x, y)$ est donné par :

$$
\begin{align}
    \text{code}_{(x, y)}| =& 2 \times |x| + |y| \\
                          =& 2 \times \log_2(x) + \log_2(y)
\end{align}
$$

Chaque bit de $x$ est associé à un bit supplémentaire alors que $y$ est recopié tel quel.

### Question 4.5)

> On définit un nouveau codage :
>
> $$
> \text{code}_2(x, y) = t_1 0 t_2 0 ... t_{l-1} 0 t_{l} 1 x_1 x_2 ... x_n y_1 y_2 ... y_m
> $$
>
> Où $x_1 x2 ... x_n$ et $y_1 y_2 ... y_m$ sont les représentations binaires respectives de $x$ et $y$, et où $t_1 t_2 ... t_l$ est la représentation binaire de l'entier $n$, lui même la taille de la représentation binaire de $x$.
>
> Ce codage est-il injectif ?

Le codage est bien injectif. Soit :

$$
\text{code}_2 (x, y) = a_1 a_{\alpha}
$$

On sait que $| t | = n = min \{i | a_{2i} = 1 \}$

Donc on a :

$$
\begin{align}
    t =& (a_{2i+1})_{i \in [0, 2|n|[} \\
    x =& (a_i)_{i \in [2|n|+1, 2|n| + |x|[} \\
    y =& (a_i)_{i \in [2|n| + |x| +1, 2|n| + |x| + |y| +1]}
\end{align}
$$

<!-- Pour la colorisation des parenthèses : ]] -->

### Question 4.6

> Donnez le codage du couple ``(10, 5)``.

Récupérons la représentation binaire de 10 : ``1010``. Sa taille est de 4, soit ``100`` en binaire. Puis on récupère la représentation binaire de 5 : ``101``.

On a alors le code suivant : ``10000011010101``.

Ici le codage n'est pas rentable par rapport au codage $\text{code}_1$, puisqu'il obtient un résultat plus grand.

### Question 4.7)

> Quel est le couple $(x, y)$ associé au codage ``100011100011001`` ?

On remarque que l'index ``6`` est le premier index pair à valoir `1`. On a donc ``100011``. On récupère donc un bit sur deux pour obtenir ``101``, soit 5, la taille de la représentation binaire de $x$.

On sait donc que la représentation binaire de $x$ se trouve entre les indices ``6`` et ``6+5 = 11``. Elle est donc ``10001`` (= `17`).

Les bits restant forment la représentation binaire de $y$, soit ``1001`` (= `9`).

On a donc $(x, y) = (17, 9)$

### Question 4.8)

> Quel est le nombre de bits utilisés pour coder un couple $(x, y)$ ?

Le nombre de bits utiliser pour coder le couple $(x, y)$ est donné par :

$$
\begin{align}
    \text{code}_{(x, y)}| =& 2 \times ||x|| + |x| + |y| \\
                          =& 2 \times \log_2(\log_2(x)) + \log_2(x) + \log_2(y)
\end{align}
$$

Chaque bit de $|x|$ est associé à un bit supplémentaire alors que $x$ et $y$ sont recopiés tel quel.

### Question 4.9)

> On souhaite généraliser ce codage aux tuples d'entiers $(x^1, ..., x^k)$ pour $k$ quelconque.
>
> Proposez un tel codage nommé $\text{code}_3$.
