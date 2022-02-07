# Complexité et Calculabilité - TD1 : Cardinalité et machines de Turing

> Rappel : pour $A \sube \Sigma^*_A$ et $B \sube \Sigma^*_B$ deux langages, $A \leqslant^T_m B$ signifie que $A$ se réduit à $B$ :
> $$
> A \leqslant^T_m B \Leftrightarrow \exists F : \Sigma^*_A \rightarrow \Sigma^*_B\\
> \\
> F~\text{calculable} | \forall w \in \Sigma^*_A, w \in A \Leftrightarrow F(w) \in B
> $$

## Exercice I : Utilité des réductions

> Démontrer les quatres énoncés suivants :

### Question I.1)

> Si $A \leqslant^T_m B$ et $B$ est décidable, alors $A$ est décidable.

Supposons que $A \leqslant^T_m B$ et que $B$ est décidable. On a $M_f$ qui calcule $f$. On a $M_B$ qui décide $B$.

<!-- TODO : Insérer diagramme de $M_a$ et son ruban -->

$M_A$ décide $A$.

Si $w \in A$ alors $f(w) \in B$. \
Si $w \notin A alors f(w) \notin B$.

$M_A$ écrit sur la bande $F(w)$ et lance $M_B$ :

- Si $f(w) \in B (w \in A)$, $M_B$ accepte $w$.
- Si $f(w) \notin B (w \notin A)$, $M_B$ n'accepte pas $w$.

Donc $M_A$ décide $A$.

### Question I.2)

> Si $A \leqslant^T_m B$ et $B$ est semi-décidable, alors $A$ est semi-décidable.

Supposons que $A \leqslant^T_m B$ et que $B$ est semi-décidable. On a $M_f$ qui calcule $f$. On a $M_B$ qui semi-décide $B$.

<!-- TODO : Insérer diagramme de $M_a$ et son ruban -->

$M_A$ semi-décide $A$.

Si $w \in A$ alors $f(w) \in B$. \
Si $w \notin A alors f(w) \notin B$.

$M_A$ écrit sur la bande $F(w)$ et lance $M_B$ :

- Si $f(w) \in B (w \in A)$, $M_B$ accepte $w$.
- Si $f(w) \notin B (w \notin A)$, $M_B$ n'accepte pas $w$.

Donc $M_A$ semi-décide $A$.

### Question I.3)

> Si $A \leqslant^T_m B$ et $B$ n'est pas décidable, alors $A$ n'est décidable.

On utilise la contraposée de la [Question 1](#question-i1).

### Question I.4)

> Si $A \leqslant^T_m B$ et $B$ n'est pas semi-décidable, alors $A$ n'est pas semi-décidable.

On utilise la contraposée de la [Question 12](#question-i2).

## Exercice II : Ma première machine de Turing *many-one*

### Question II.1)

> Réduire $L_{halt} = \{ \langle M \rangle | M ~ \text{s'arrête quand on la lance sur l'entrée vide} \}$

$f(w) = w$ si $w$ n'est pas le code d'une machine de Turing, sinon $w = \langle M \rangle$

$f(\langle M \rangle) = \langle M' \rangle$

<!-- TODO : Insérer diagramme de $M_a$ et son ruban -->

### Question II.2)

> En utilisant [L'exercice I](#exercice-i-utilité-des-réductions), que peut-on déduire ?

Soit $w \in L_{halt}$ de $w = \langle M \rangle | M ~ \text{s'arrête quand on la lance sur l'entrée vide}$. Donc $M'$ (avec $f(w) = \langle M' \rangle$) qui efface $a~a$ avant de lire $M$ va s'arrêter sur $a~a$.

Donc $\langle M' \rangle = f(w) \in A$.

<!-- FIXME : Il me manque une partie de la correction sadly -->

## Exercice III : Complémentaire

> Soit la machine de Turing suivante, sur l'alphabet d'entrée $\Sigma = \{ 0, 1 \}$

<!-- TODO : Ajouter un diagramme de la machine de Turing en question -->

### Question III.1)

> Cette machine de Turing s'arrête-t-elle sur toute entrée ?

$M$ se déplace à chaque transition la tête à droite et s'arrête si elle rencontre un Blanc. Donc, au pire des cas, elle s'arrête en $|w|$ étapes.

### Question III.2)

> Construire une machine de Turing $M'$ telle que $L(M')= \Sigma^* ~ \backslash ~ L(M)$

<!-- TODO : Ajouter un diagramme de $M'$ -->

On construis la complémentaire de $M$ : elle accepte tous les mots que $M$ n'acceptait pas, et refuse ceux qu'elle acceptait.

## Exercice IV : Réduction Turing *many-one*

> Écrire chacune des réductions (Turing *many-one*) suivantes, et indiquer ce que l'on peut en déduire quant à la récursivité de ces langages

### Question IV.1)

> Réduire $L_u = \{ \langle M \rangle \# w | M~\text{accepte le mot}~w \}$ à $B = \{{ \langle M \rangle | a \in L(M) \}}$

On pose $f : \langle M \rangle \# w \rightarrow \langle M' \rangle$ avec $M'$ qui, dans l'ordre :

- Efface $a$
- Écris $w$
- Rembobine
- Lance $M$

<!-- TODO : Rajouter un diagramme de la machine -->

### Question IV.2)

> Réduire $L$ à $aL = \{ aw | w \in L \}$ pour tout langage $L$.

On pose $L \leqslant^T_m aL$. On a donc : $f : w \rightarrow a w$.

<!-- TODO : Rajouter un diagramme de la machine -->

### Question IV.3)

> Réduire $aL$ à $L$ pour tout langage $L \sube \{ a, b \}^*$.

On pose : $\exists u \in \{ a, b \}^* \backslash L$. On ne sait rien de plus sur $L$, on a donc deux cas de figures :

$$
f(w) =
\begin{cases}
v ~ \text{si}~ w = av \\
u
\end{cases}
$$

<!-- TODO : Rajouter un diagramme de la machine -->

### Question IV.4)

<!-- NOTE : Si jamais on compare avec le "polycopié" original projeté au tableau, on remarque l'absence de "primes" dans la définition de C. Ici, c'est normalement correct -->

> Réduire $L_{\overline{u}} = \{ \langle M \rangle \# w | M~ \text{n'accepte pas}~ w \}$ à $C = \{ \langle M' \rangle \# w' | M' ~ \text{n'accepte pas} ~ w ~ \text{mais accepte} ~ bbw \}$.

On pose $L_{\overline{u}} \leqslant^T_m C$. On a donc  $f : \langle M \rangle \# w \rightarrow \langle M' \rangle \# w'$.
Si $M'$ lit $w$ alors elle lance $M$. Sinon, $M'$ accepte.

<!-- TODO : Rajouter un diagramme de la machine -->

### Question IV.5)

> Réduire $L_{stupide} = \{ a \}$ à $L_w$.

On pose $L_{stupide} = \{ a \} \leqslant L_u$. On a donc $f: w \rightarrow \langle M \rangle \#w'$. On retrouve donc :

$$
f(w) =
\begin{cases}
\#a & \text{si} ~ w = a \\
\#e & \text{sinon}
\end{cases}
$$

## Exercice VII : Avec des réductions de Turing *many-one*

### Partie A

> Montrer que les langages suivants ne sont pas décidables.

#### Question VII.A.1)

> $D = \{ \langle M \rangle | M ~\text{s'arrête quand on la lance sur les entrées}~ ab ~\text{et}~ ba \}$.

On pose : $\L_u \leqslant^T_m D = \{ \langle M \rangle | M ~\text{s'arrête quand on la lance sur les entrées}~ ab ~\text{et}~ ba \}$. On a :

<!-- FIXME : La note "XXX" correspond à une sorte de "matrice" que j'arrive pas à lire au tableau -->

$$
F(v) =
\begin{cases}
\langle XXX \rangle x & w ~\text{ne correspond pas à}~ \langle M \rangle \# w \\
\langle M' \rangle    & \text{avec}~ v = \langle M \rangle \# w
\end{cases}
$$

Avec $M'$ qui efface l'entrée :

- Efface le ruban
- Écrit $w$
- Place la tête de lecture à gauche
- Simule $M$
- Si sur un état non acceptant $\Rightarrow$ boucle infinie

<!-- TODO : Ajouter le ruban de la machine -->

On se retrouve avec :

- Si $v = \langle M \rangle \in L_u$, alors $M$ accepte $w$ et donc $M'$ va s'arrêter sur toutes les entrées, dont $ab$ et $ba$. Donc on a bien $F(v) = \langle M' \rangle \in D$.
- Si $v = \langle M \rangle$ n'accepte pas $w$ alors sur toutes les entrées, $M'$ va faire une boucle infinie :
    - Soit car $M$ ne s'arrête pas sur $w$
    - Soit car $M$ infirme <!-- TODO : Vérifier ça --> $u$ et $M'$ entre dans un état de boucle infinie.

Dans les deux derniers cas, on a $f(v) = \langle M' \rangle \notin$.

$L_u$ n'est pas co-semi-décidable. Ainsi, $D$ qui est par définition plus difficile, n'est pas co-semi-décidable.

#### Question VII.A.2)

> $E \times F$ avec $E = \{ \langle M \rangle | b \in L(M)\}$ et $F = \{ \langle M \rangle | a \in L(M) ~\text{ou}~ b \in L(M)}$

On pose $L_u \leqslant^T_m E \times F$.

On a donc $F($\langle M \rangle \# w) = \langle M' \rangle \# \langle M' \rangle$.

$M'$ a le comportement suivant :

- Efface le ruban
- Écrit $w$
- Place la tête de lecture à gauche (= rembobine)
- Simule $M$

Se présente alors à nouveaux deux cas :

- Si $\langle M' \rangle \# w \in L_u$, alors $M$ accepte $w$, donc $M'$ accepte toutes les entrées dont $a$ et $ab$, donc $\langle M' \rangle \in E$ et $\langle M' \rangle \in F$, donc $F(\langle M \# w \rangle) = \langle M' \rangle \# \langle M' \rangle \in E \times F$.
- Si \langle M \rangle \# w \in L_u$, alors $M$ n'accepte pas $w$, donc $M'$ n'accepte aucune entrée, donc $\langle M' \rangle \notin E$, donc $f(\langle M \rangle \# w) = \langle M' \rangle \# \langle M' \rangle \notin E \times F$.

En conclusion, $L_u \leqslant^T_m E \times F$ et $L_u$ n'est pas co-semi-décidable, donc $E \times F$ non plus.

### Partie B

> Montrer que les langages suivants ne sont pas semi-décidables.

#### Question VII.B.3)

> $G = \{ \langle M \rangle | L(M) = \ \}$

#### Question VII.B.4)

> $H = \{ \langle M_1 \rangle \# \langle M_2 \rangle | L(M_1) = L(M_2) \}$
