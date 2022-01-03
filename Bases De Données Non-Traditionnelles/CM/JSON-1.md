# Base de Données non-traditionnelles : `JSON` - 1

## Présentation du `JSON`

<!-- cspell:disable-next-line -- Pour l'explication du nom JSON -->
Le `JSON` (Pour **J**ava**S**cript **O**bject **N**otation),prononcé "Djèï-Sonne" est un langage de __sérialisation__ de données. Il est hérité dela notation objet du JavaScript, comme son nom l'indique.

Le `JSON` utilise pour stocker les informations une __structure en arbre__ et des couples __clef-valeur__. Chaque clef est une __chaîne de caractères__, chaque valeur peut être :

- Un autre objet `JSON`
- Un tableau
- Un entier
- Un flottant
- Une chaîne de caractères

Exemple :

```json
{
    "items": [
        {
            "name":  "index",
            "label": "Accueil"
        },
        {
            "name":  "graphe",
            "label": "Graph"
        }
    ]
}
```

En ligne de commandes, il existe le programme `jq`, permettant de filtrer des données `JSON`. La syntaxe ressemble à celle de la commande `sed` : ``jq [REQUÊTE] [FICHIER]``

## Modélisation de Données

La modélisation des données est un processus important dont le but est la création d'une structure adaptée au projet. En BDD traditionnelles, on a déjà vu les années passées comment former un bon modèle.

En BDD non-traditionnelles, il faut traiter les projets différemment. Par exemple, il faut éviter les jointures : il s'agit ici d'un produit cartésien puis d'un filtre selon une correspondance de clefs. Dan sun contexte de données réparties, c'est un processus qui peut s'avérer extrêmement lourd. Il faut modéliser les données pour qu'elles soient stockées au plus proche de la manière dont elles seront exploitées.

Un bon principe est de stockées les données de manière à ce que les données entrées soient similaires aux données sorties.

## Sources

- CM de Monsieur François Rioult du 3/01/2022
