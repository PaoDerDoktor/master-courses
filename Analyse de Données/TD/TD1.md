# Analyse de Données - TD1 : Enquête sur l'Atlas des paysages

> Lors d'une enquête électorat de l'Atlas des paysages (Atlas Dreal), 176 personnes ont été interrogées. Elles devaient notamment répondre aux questions suivantes :
>
> |                         Question                        |   Réponses   | libellé  |
> |:--------------------------------------------------------|-------------:|:--------:|
> | Souhaitez-vous une simplification de l'atlas ?          | `Oui`, `Non` |  `simpl` |
> | Souhaitez-vous une actualisation régulière de l'atlas ? | `Oui`, `Non` |  `actu`  |
> | Souhaitez-vous une version numérique de l'atlas ?       | `Oui`, `Non` |   `num`  |

## Statistiques Descriptives - Analyse en Correspondance Simple (ACS)

### Question 1)

> Comment appelle-t-on les possibilités de réponse `Oui` et `Non` ? Quelle est la nature des variables `simpl`, `actu` et `num` ?

`Oui` et `Non` sont appelées **modalités**.
`simpl`, `actu` et `num` sont des variables de nature **quantitative**.

### Question 2)

> Le fait de souhaiter une simplification de l'atlas implique-t-il de la part des personnes interviewées que l'atlas soit numérique ? À partir du tableau `1a`, établissez les calculs à la main. Retrouvez votre résultat en vous appuyant sur la sortie `1b`.
>
> |``base1$numérique``/``base1$simp1`` | simplification : `Non` | simplification : `Oui` |
> |-----------------------------------:|-----------------------:|-----------------------:|
> |                  numérique : `Non` |                   `26` |                   `11` |
> |                  numérique : `Oui` |                   `81` |                   `60` |
>
> ```text
> Person's chi-squared test with Yates' continuity correction
> data: base1$numérique and base1$simpl
> X-squared = 1.5108, df = 1, p-value = 0.219
> ```
>
> Le $\chi^2$ lu est de `3.84`

Il s'agit de savoir si les deux variables `simpl` et `num` sont ou non indépendantes. Pour ce faire, on effectue le test du $\chi^2$

Tableau des effectifs théoriques :

| ``base1$numérique``/``base1$simp1`` |       simplification : `Non` |      simplification : `Oui` |
|------------------------------------:|-----------------------------:|----------------------------:|
|                   numérique : `Non` | $\frac{ 37 \times 107}{178}$ | $\frac{ 37 \times 71}{178}$ |
|                   numérique : `Oui` | $\frac{141 \times 107}{178}$ | $\frac{141 \times 71}{178}$ |

Soit :

| ``base1$numérique``/``base1$simp1`` | simplification : `Non` | simplification : `Oui` | Totaux |
|------------------------------------:|-----------------------:|-----------------------:|:-------|
|                   numérique : `Non` |                `22.24` |                `14.76` | `37`   |
|                   numérique : `Oui` |                `84.76` |                `56.24` | `141`  |
|                              totaux |                  `107` |                   `71` |        |

Tableaux des différences au carré entre effectifs théoriques et effectifs observés :

| ``base1$numérique``/``base1$simp1`` | simplification : `Non` | simplification : `Oui` |
|------------------------------------:|-----------------------:|-----------------------:|
|                   numérique : `Non` |       $(26 - 22.24)^2$ |       $(11 - 14.76)^2$ |
|                   numérique : `Oui` |       $(81 - 84.76)^2$ |       $(60 - 56.24)^2$ |

Soit :

| ``base1$numérique``/``base1$simp1`` | simplification : `Non` | simplification : `Oui` |
|------------------------------------:|-----------------------:|-----------------------:|
|                   numérique : `Non` |            ``14,1376`` |            ``14,1376`` |
|                   numérique : `Oui` |            ``14,1376`` |            ``14,1376`` |

On effectue la correction de Yates :

| ``base1$numérique``/``base1$simp1`` |       simplification : `Non` |       simplification : `Oui` |
|------------------------------------:|-----------------------------:|-----------------------------:|
|                   numérique : `Non` | $\frac{(3.76-0.5)^2}{22.24}$ | $\frac{(3.76-0.5)^2}{14.76}$ |
|                   numérique : `Oui` | $\frac{(3.76-0.5)^2}{84.76}$ | $\frac{(3.76-0.5)^2}{56.24}$ |

Soit environ :

| ``base1$numérique``/``base1$simp1`` | simplification : `Non` | simplification : `Oui` |
|------------------------------------:|-----------------------:|-----------------------:|
|                   numérique : `Non` |               ``0.47`` |               ``0.72`` |
|                   numérique : `Oui` |               ``0.13`` |               ``0.19`` |

On retrouve alors le $\chi^2\ en faisant la somme : ``1,51``

Si on se réfère à la [table du $\chi^2$](https://archimede.mat.ulaval.ca/stt1920/STT-1920-Loi-du-khi-deux.pdf), on est à `1` degré de liberté, avec un risque $\alpha = 0.

Soient :

- $H_0$ l'hypothèse des variables *indépendantes*
- $H_1$ l'hypothèse des variables *non-indépendantes*

Le $\chi^2$ calculé avec la correction de Yates comparé au $\chi^2$ lu est bien inférieur. On ne rejette donc pas l'hypothèse $H_0$ et les variables, pour ce jeu de données, sont indépendantes.

De la même façon, la `p-value` donnée d'après le tableau `1b` étant de `0.219` est bien supérieure au niveau de risque de 5%, nous permettant de retenir $H_0$

### Question 3)

> Quels types de variables pourriez-vous rajouter pour mieux connaître le profil du répondant ?

On pourrait rajouter des variables qualitatives : Catégorie socio-professionnelle, sexe, âge...

## Statistiques Descriptives - Analyse en Correspondance Multiples (ACM)

> Tableau 2 : XXX
> |   | 0 | 1 | 0 | 1 | 0 | 1 |
> |:--|--:|--:|--:|--:|--:|--:|
> | 1 | 1 | 0 | 0 | 1 | 0 | 1 |
> | 2 | 0 | 1 | 0 | 1 | 0 | 1 |
> | 3 | 0 | 1 | 0 | 1 | 0 | 1 |
> | 4 | 0 | 1 | 0 | 1 | 0 | 1 |
> | 5 | 0 | 1 | 0 | 1 | 1 | 0 |
> | 6 | 0 | 1 | 1 | 0 | 1 | 0 |
> | 7 | 0 | 1 | 0 | 1 | 0 | 1 |
> | 8 | 0 | 1 | 0 | 1 | 0 | 1 |
> | 9 | 0 | 1 | 0 | 1 | 1 | 0 |

### Question 4)

> Comment appelle-t-on le tableau 2 ? Combien ce tableau a-t-il de lignes ? À quoi correspondent-elles ? Et pour les colonnes ?

Le tableau 2 est un **tableau disjonctif complet**. Il possède *autant de lignes que d'individus*, soit ici **176 lignes**. les colonnes, elles, représentent **toutes les modalités de toutes les variables** (puisque le tableau est *complet*) soit **6** colonnes (*3 variables* de chacune *2 modalités*).

### Question 5)

<!-- TODO : À compléter -->

> Soit le tableau `3` :
> 
> |           | `num=0` | `num=1` | `act=0` | `act=1` | `simpl=0` | `simpl=1` |
> |:----------|:-------:|:-------:|:-------:|:-------:|:---------:|:---------:|
> | `num=0`   |    37   |     0   |     6   |    31   |    26     |     11    |
> | `num=1`   |     0   |   141   |    28   |   113   |    81     |     60    |
> | `act=0`   |     6   |    28   |     0   |     0   |    20     |     14    |
> | `act=1`   |    31   |   113   |     0   |    NA   |    87     |     57    |
> | `simpl=0` |    26   |    81   |    20   |    87   |    NA     |      0    |
> | `simpl=1` |    11   |    60   |    14   |    57   |     0     |     71    |

Le tableau `3` est un tableau de **Burt**.

Chaque case ``(x=a, y=b)`` correspond au nombre d'individus ayant dans leur réponse les propriétés `x=a` et `y=b` en même temps. Ainsi, le tableau est symétrique par rapport à sa diagonale, et si ``x == y``, alors deux cas de figure se présentent :

- Si ``a = b``, on demande une seule propriété, donc la valeur de la case est le nombre d'individus possédant cette propriété
- Si ``a != b``, comme on ne peut choisir qu'une modalité à la fois, la valeur de la case est `0` (aucun individu ne peut choisir deux modalités différentes pour le même caractère)

### Question 6)

> Combien d'axes peut-on utiliser pour représenter nos variables (tableau `4`) ? Quelle est la proportion de l'inertie représentée par les deux premiers axes ? Retrouver le résultat par calcul.

