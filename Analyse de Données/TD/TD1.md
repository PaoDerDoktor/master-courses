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

> Tableau `2` : XXX
>
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
>
> Comment s'appelle le tableau 3 ? Identifiez les valeurs manquantes notées NA

Le tableau `3` est un tableau de **Burt**.

Chaque case ``(x=a, y=b)`` correspond au nombre d'individus ayant dans leur réponse les propriétés `x=a` et `y=b` en même temps. Ainsi, le tableau est symétrique par rapport à sa diagonale, et si ``x == y``, alors deux cas de figure se présentent :

- Si ``a = b``, on demande une seule propriété, donc la valeur de la case est le nombre d'individus possédant cette propriété
- Si ``a != b``, comme on ne peut choisir qu'une modalité à la fois, la valeur de la case est `0` (aucun individu ne peut choisir deux modalités différentes pour le même caractère)

### Question 6)

> Combien d'axes peut-on utiliser pour représenter nos variables (tableau `4`) ? Quelle est la proportion de l'inertie représentée par les deux premiers axes ? Retrouver le résultat par calcul.
>
> Soit le tableau `4` - les valeurs propres :
>
> ``eigenvalue percentage of variance cumulative percentage of variance``
> | dim 1 | 0.3724075 | 37.24075 |  37.24075
> | dim 2 | 0.3306734 | 33.06734 |  70.30809
> | dim 3 | 0.2969191 | 29.69191 | 100.00000

Le nombre d'axes requis pour représenter nos variables est de 3, puisqu'on dispose de 3 variables actives (valeur propre différente de 0).

L'inertie représentée par les deux premiers axes est de 70.30% (le premier axe est de 37.24% et le second de 33.06%, ``33.06 + 37.24 = 70.30``).

**On rappelle la "règle" pour conserver des axes :** On conserve les axes  qui expliquent plus de $\frac{1}{p}$ de la variance totale, $p$ étant le nombre de variables

On peut conserver l'axe `dim1` et l'axe `dim2`, puisqu'ici $\frac{1}{p} = \frac{1}{3}$ et que les deux axes ont une valeur propre supérieure à $\frac{1}{3}$, contrairement à `dim3` qui n'a qu'une valeur propre de 0.29.

### Question 7)

> Les contributions sont données dans le tableau `5`. Certaines données sont manquantes, identifiez-les. Commentez.
>
> Soit le tableau `5` - tableau des contributions
>
> | modalité / Dimension |  `Dim 1`  |   `Dim 2`  |   `Dim 3`  |
> |:---------------------|----------:|-----------:|-----------:|
> | `numérique_0`        |     NA    |     NA     |     NA     |
> | `numérique_1`        |  9.953803 |  0.1637762 | 10.6689378 |
> | `actualisation_0`    |  6.986420 | 71.6494994 |  2.2629571 |
> | `actualisation_1`    |  1.649572 | 16.9172429 |  0.5343093 |
> | `simpl_0`            | 17.342407 |  4.2461834 | 18.2990503 |
> | `simpl_1`            | 26.135740 |  6.3991779 | 27.5774420 |

Les valeurs du tableau `5` sont des pourcentages. Ces pourcentages indiquent le taux auxquels les différentes variables contribuent aux coordonnées de la dimension indiquée. La somme des taux de chaque dimension doit être égale à 100, on trouve ainsi :

| modalité / Dimension |  `Dim 1`  |   `Dim 2`  |   `Dim 3`  |
|:---------------------|----------:|-----------:|-----------:|
| `numérique_0`        | 37.932059 |  0.6241202 | 40.6573035 |
| `numérique_1`        |  9.953803 |  0.1637762 | 10.6689378 |
| `actualisation_0`    |  6.986420 | 71.6494994 |  2.2629571 |
| `actualisation_1`    |  1.649572 | 16.9172429 |  0.5343093 |
| `simpl_0`            | 17.342407 |  4.2461834 | 18.2990503 |
| `simpl_1`            | 26.135740 |  6.3991779 | 27.5774420 |

- Pour l'axe 1 : la modalité `numérique_0` contribue fortement, avec la variable `simpl` sur ses deux modalités.
- Pour l'axe 2 : La variable `actualisation` contribue fortement sur ses deux modalités, la variable `numérique` contribue à peine.
- Pour l'axe 2, la modalité `numérique_0` contribue fortement; avec `simpl_1`.

### Question 8)

> Quel indicateur est représenté dans le tableau 6 ? Compléter les valeurs manquantes, puis commenter.
>
> Soit le tableau `6` - Qualité de la représentation :
>
> | modalité / Dimension |   `Dim 1`  | `Dim 2` |   `Dim 3`  |
> |:---------------------|-----------:|--------:|-----------:|
> | `numérique_0`        | 0.53499165 |    NA   | 0.45719225 |
> | `numérique_1`        | 0.53499165 |    NA   | 0.45719225 |
> | `actualisation_0`    | 0.09648324 |    NA   | 0.02491225 |
> | `actualisation_1`    | 0.09648324 |    NA   | 0.02491225 |
> | `simpl_0`            | 0.48574766 |    NA   | 0.40864822 |
> | `simpl_1`            | 0.48574766 |    NA   | 0.40864822 |

L'indicateur représenté dans le tableau `6` est le **cosinus carré** des variables. La somme de chaque ligne doit valoir 100, puisque chaque variable active doit être représentée. On calcule alors le tableau suivant :

| modalité / Dimension |   `Dim 1`  |   `Dim 2`  |   `Dim 3`  |
|:---------------------|-----------:|-----------:|-----------:|
| `numérique_0`        | 0.53499165 | 0.00781609 | 0.45719225 |
| `numérique_1`        | 0.53499165 | 0.00781609 | 0.45719225 |
| `actualisation_0`    | 0.09648324 | 0,87860451 | 0.02491225 |
| `actualisation_1`    | 0.09648324 | 0,87860451 | 0.02491225 |
| `simpl_0`            | 0.48574766 | 0,10560412 | 0.40864822 |
| `simpl_1`            | 0.48574766 | 0,10560412 | 0.40864822 |

<!-- TODO : Peut-être rajouter un commentaire -->

### Question 9)

> Comment pourriez-vous interpréter les axes ?
> <!-- Rajouter le graphe -->

Le graphe est un plan factoriel. C'est une représentation des variables d'origine, sur le plan factoriel défini par `Dim 1` et `Dim 2`.

L'axe 1 Rapproche ceux qui souhaitent une numérisation de ceux qui souhaitent une simplification, et réciproquement (ceux qui ne souhaitent pas une numérisation de ceux qui ne souhaitent pas de simplification).

L'axe 2 semble quant à lui opposer les personnes voulant actualiser régulièrement l'atlas à ceux qui ne le veulent pas.
