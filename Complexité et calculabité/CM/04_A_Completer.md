# A compléter

## Rappels : Réduction

### Théorème découlant de *HALT*

> Le langage $L_u \{ \langle M \rangle \# w | M ~\text{accepte le mot}~ w \}$ n'est pas décidable.

### Définition : Réduction de Turing

> Une **réduction (*many-one*) de Turing** du langage $A$ au langage $B$ est une fonction calculable $f : \Sigma^*_A \rightarrow \Sigma^*_B$ telle que $w \in A \leftrightarrow f(w) \in B$. On note $A \leqslant^T_m B$.

### Théorème découlant du principe de réduction

> Si le langage $A$ se réduit au langage $B$ ($A \leqslant^T_m B$), alors :
>
> - Si $A$ n'est pas décidable alors $B$ non plus.
> - Si $A$ n'est pas semi-décidable alors $B$ non plus.
> - Si $A$ n'est pas co-semi-décidable alors $B$ non plus.

## Théorème de Rice

### Définition

> Soit $P$ une famille de langages. On appelle $P$ une *propriété non triviale* si il existe deux machines de Turing $M_1$ et $M_2$ telles que $L(M_1) \in P$ et $L(M_2) \in P$.
>
> $P$ et $\overline{P}$ peu être composés d'un nombre fini ou infini de langages, mais clairement, si $P$ est fini alors $\overline{P}$ est infini et inversement. (sous-ensembles VS ensemble)

<!-- TODO : Détailler cette dernière remarque -->

### Le théorème de Rice

<!-- TODO : À compléter -->

### Preuve du théorème de Rice

<!-- TODO : À compléter, compliquer à synthétiser en plein CM -->

## Thèse de Church Turing

Les machines de Turing ne peuvent pas calculer toutes les fonctions, comme le montre le problème du *HALT*. On peut alors se demander si on ne peut pas utiliser un autre modèle de calcul pour pallier à ce souci. On peut donc chercher si il existe d'autres modèles plus puissants et non-équivalents.

La thèse de Church-Turing sont en réalité deux thèses que la communauté scientifique admet comme vrai par leur vraisemblance, bien qu'ils soient improuvables à l'heure actuelle. On peut la résumer ainsi :

> Toute fonction physiquement calculable est calculable par une Machine de Turing.

Elle découle d'un théorème, prouvé à une version quantique uniquement :

<!-- TODO : À compléter pour synthétiser et faire deux-trois recherches supplémentaires -->