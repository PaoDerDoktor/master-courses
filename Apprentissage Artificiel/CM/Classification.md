# Apprentissage Artificiel - Classification

## Résolution d'une regression polynomiale

Les étapes pour résoudre une réduction polynomiale

- Redéfinition du problème (se ramener à un cas linéaire)
- Choix d'une fonction de coût à minimiser
- Recherche d'une solution
    - Solution analytique (Calcul de la pseudo-inverse)
    - Solution numérique (descente de gradient)

<!-- TODO : Écrire une partie sur le phénomène de suraprentissage -->

## La classification

Le principe de la classification est d'associer à tout objet une classe permettant de le qualifier (tumeur saine/maligne, mail intéressant/spam, chien carlin/bulldog/berger allemand...).

### Classification binaire

Un objet appartient ou non à une classe donnée. Les labels sont notés par convention $y \in \{0, 1\}$ ou $y \in \{-1, 1\}$, avec $1$ la classe "positive" où se trouve l'objet et $-1$ la classe négative où il ne se trouve pas

### Classification multi-classe

Un objet appartient à l'une des classes recherchées. Les labels sont notés $y \in [1, C]$ par convention, où $C$ est le nombre de classes possibles.

Pour résoudre une classification multi-classe, on a deux cas de figures :

- Notre algorithme gère naturellement le multi-classe (exemples : classificateur bayésien; $k$-plus proches voisins)
- Notre algorithme ne gère que les problèmes binaires (exemples : classifieurs logistiques)

Dans le deuxième cas, on essaie de transformer le problème de classification multi-casse en problème de classification binaire grâce à une **stratégie**

### Classification multi-classe *un-contre-tous* (one-versus-all)

<!-- TODO : Ajouter des algorithmes avec pseudo-code -->

### Classification multi-classe *un-contre-un* (one-versus-one)

<!-- TODO : Ajouter des algorithmes avec pseudo-code -->
