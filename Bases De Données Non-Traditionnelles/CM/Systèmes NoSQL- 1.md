# Bases de Données non traditionnelles : Systèmes `NoSQL`

## Basics and Concepts

### Objectifs

1. Problèmes de **scalability** (mise à l'échelle, augmenter ou diminuer les capacités du systèmes au gré des besoins) et concepts au cœur des données non-relationnelles
2. Implémentations de bases de données `NoSQL`
3. Modélisation des données : bonnes pratiques de la représentation de données

<!-- FIXME : Il va me manquer plein d'infos j'entends rien j'ai pas internet j'ai pas dormi j'entends pas le prof. N'hésitez pas à compléter du coup -->

### Pré-requis

- Bases en `UML`
- Bases en `RDBMS` (Relational DataBase Management System)
- Notions d'`SQL`
- Notions de `regex` (*regular expressions*)
- Notions d'architecture système
    - Pourquoi les ports sont-ils utilisés et pourquoi de telle manière ?
    - Systèmes distribués
- Connaissance en programmation et en algorithmes de tri/hachage
    - `Python`
    - `Java`
    - `Go`
    - ...

## Pourquoi ?

> Comment étendre une base de données traditionnelle ?

1. Couche application directement connectée au `DBMS` (DataBase Management System)
2. De plus grandes boites
3. Étendre avec une queue
4. Étendre en partageant la base de données

**Plus on a d'utilisateurs et/ou de données, plus il est difficile et coûteux d'augmenter les capacités du système**.

> Comment gérer l'accroissement du volume de donnée ?

- Créer un système de tolérance  aux pannes
- Gérer la logique de maintenance (construire et maintenir des copies, des partitions)
- Gérer les corruptions (notamment les erreurs humaines)
- Composer avec des performances limités

**Il est difficile d'analyser des problèmes de ce genre avec une approche traditionnelle**.

Les **trois V** :

- Volume
- Vélocité
- Variété

Un problème de Big Data est un problème lourd non seulement en volume (poids) de données; mais aussi en hétérogénéité et en complexité des données (et traitement)

<!-- À partir de là j'ai dû aller dormir, Justine a gentiment pris la suite des notes
------------------------------------- Justine ----------------------------------------------
-->

Avantages :

- **Ressource Sharing** (*Partage des ressources*) : partager les ressources matérielles et logicielles
- **Openness** (*ouverture*) : flexibilité d'utilisation de matériels et logiciels de différents concepteurs
- **Concurrency** (*concurrence*) : traitement concurrent pour améliorer les performances
- **Scalability** (*possibilité de mise à l'échelle / développement*) : capacités de traitement améliorées en ajoutant de nouvelles ressources
- **Fault Tolerance** (*tolérance aux pannes*) : Capacité de continuer à fonctionner après qu'une panne ait eu lieu

Inconvénients :

- Complexité plus grande
- Sécurité plus faible
- Gestion plus compliquée
- Imprédictibilité
- Plus de tout-`SQL`
- Plus de tout-atomique

## Différence entre un système `NoSQL` et `SQL`

- Normalisation des données

<!-- FIXME :  (trouver un exemple plus facile et plus clair). -->

Quand on écrit les données, elles sont écrites dans une seule table. Par exemple : si les code postaux se multiplient, plusieurs personnes à caen (``14000``), 90x 14000 pris, on va écrire cette valeur 14 fois plutôt qu'une seule fois. À la place on fait une table avec l'id, la ville et le code postal.

On évite la double écriture des données. On écrit à un endroit et on fait référence a ces données ailleurs

- Non normalisé

Une table = une vue utilisateur

Ici, on dédouble les informations. Il peut y avoir plus d'écriture. A chaque fois que l'on écrit des data, il faudra les ressortir.

```text
écriture    Normalisation        Dreamland
^
|           Mauvais design       Dé-normalisation
|
|         ---> lecture
```

- Une transaction est une unité logique indépendamment exécutée pour récupérer les données ou les mettre à jour

<!-- cspell: disable-next-line --- Pour l'explication d'"ACID" -->
Les transaction doivent être ACID (**A**tomicity, **C**onsistency, **I**solation, **D**urabilty - soit Atomicité, Cohérence, Isolation, Solidité).
Atomic => Transaction = liste d'opération. Toutes les opérations doivent pouvoir être effectuées. Si l'une d'elle échoue, on annule toutes les opérations (*rollback*). Sinon, on confirme ces modification.

### Stockage des données

Aujourd'hui, stockage sur la ram et persistance sur le disque dur.

### Scalability

Deux types : *Verticale* et *Horizontal*.

- **Verticale** : Ajout de RAM, disque dur, etc.
- **Horizontale** : Ajout de machines. On cherche a gagner 100% de performances, mais c'est peu possible du fait de l'overhead (ajout de charge de travail) causé par des échanges réseau et autres. SQL ne fonctionne plus avec ce système.

### Réplication des données

Utilisation de raid. Pour les systèmes distribués, on ne peut pas se contenter de copier le disque, il faut que le système soit indépendant.

<!-- TODO : Vérifier la source -->

La réplication est un changement d'état de la base de données : on écrit data sur la base de données principale puis sur d'autres bases de données. Pour être sur pas de ne pas perdre de données, il faut répliquer 3 fois la data (source : Google en 2008 ?).

#### Comment répliquer la data ?

- **Fully synchronized** (*complètement synchrone*) : Attendre que tous les replicas soient synchronisés pour répondre
- **Asynchronous** (*asynchrone*) : La base de données principale prends des informations et répond une application. Il se charge ensuite de prévenir les autres bases de données.

### Partitionnement et sharing

- **Partitionnement** : Division locale de jeux de données et de ces éléments constituants en des parts distinctes et indépendantes. Un partitionnement peut être horizontal : différentes lignes dans différentes tables.
- **Shard** (*Eclat / morceau*) : Partition horizontale dans un moteur de recherche ou une base de données. une partition est une shard. Chaque shard de base de données est gardée sur une instance de serveur de base de données séparée pour équilibrer la charge.

L'idée est de réduire le nombre de lignes par bases de données, et d'étaler la charge sur plusieurs serveurs pour mieux la supporter.

Un partitionnement vertical requiert la création de tables avec moins de colonnes et utilisant des tables additionnelles pour stocker les colonnes restantes.

Comment partager efficacement la charge ?

Deux critères :

1. Le partage doit être équilibré
2. On évite la lecture sur plusieurs bases, puisque cela nous ferait perdre la scalability horizontale

<!-- TODO : À compléter -->

- **Range partitioning** : Les codes postaux inférieurs à `x` sont sur la base de données n°1, les codes postaux inférieur à `y` sont sur la base de données n°2, etc.
- **List partitioning** : Chaque partition est associée à une liste de valeurs (code de pays type `['fr', 'ca', ...]` par exemple)
- Roundrobin partitioning
- Hash partitioning

<!-- TODO : Vérifier cette information -->

Partitioning et partage sont contradictoires.

Plusieurs manières de faire :

- Plusieurs machines qui partagent la mémoire
- Plusieurs machines partagent le disque
- Aucun partage

On retrouve beaucoup d'avantages.

Inconvénients :

- **Latence** majeure
- Plus grande **dépendance sur l'interconnexion** entre les serveurs
- Beaucoup plus d'**indices**
- Besoin de **protocoles** pour interagir avec toutes les machines
- Problèmes de **continuité** (*consistency*)
- **Requêtes** plus grandes et complexes

#### Sharding & replication working together

Le principe est de transformes des données complètes en petite données (cf schema précédent par Justine)

<!-- TODO : revérifier cet rappel, Justine n'est pas sûre, le prof a mal expliqué selon elle -->

**Rappel sur le hashing :** Le hashing permet de distribuer la charge de manière équitable sur les différents serveurs. C'est important pour bien répartir l'écriture sur les différentes bases de données et ne pas surcharger une base de données en particulier. C'est un système qui permet donc de répartir les réécritures en cas d'ajout d'un nœud.

La réponse quand on fait une requête, doit toujours être valide

Sur système répliqué, une commande `update` mets la base de données n°1 à jour mais pas la n°2.

Un système constant est un système capable de répondre la vérité **à chaque fois** qu'on lui pose une requête.

### Approche de la concurrence

On utilise différents éléments :

- **Locks** (*verrous*) : 1 utilisateur à la fois pour lire ou modifier même objet
- **MVCC (Multi Version Concurrency Control)** (*Contrôle de Concurrence Multi-Version*) : Garantir une lecture consistent en une vue de la base de données mais résultant en de multiples versions conflictuelles d'une entité si de multiples utilisateurs la modifient en même temps.
- Certains système ne comportent pas d'Atomicité.
- **ACID**

#### Protocole de `commit` et de consensus

Protocole de commit en deux phases :

- Phase 1 :
    - Le coordinateur envoie "prepare to `commit`"
    - Les subordonnés s'assurent d'en être capable dans tous les cas
    - Les subordonnés répondent "prêt à `commit`"
- Phase 2 :
    - Si tous les subordonnés répondent qu'ils sont prêt, alors on envoie le commit
    - On attends la réponse
    - Si quelqu'un rate son commit, on envoie un signal d'avortement

**Paxos** est le protocole le plus courant. Il ajoute un système de vote majoritaire.

### Constance finale

Dans un système distribué, il n'est pas possible avoir d'avoir des données cohérentes à 100% tout le temps. Il faut faire avec.

Limitation des systèmes distribués : théorème du pic

Dans un système, nous voulons des données toujours cohérentes, disponibles (pas de `deadlock`), avec tolérance de partition (si la machine crash, pas de perte et reconstitution presque automatique)

Un système peut présenter au maximum 2 caractéristiques, pas possible de faire plus. En général on choisit la disponibilité plutôt que la cohérence.

ACID :

- Atomicité : Tout le processus est effectué, sinon rien
- Consistent : Respect des contraintes de la BDD
- Isolé : Apparition à l'utilisateur comme si seul un traitement s'effectuait à la fois (on ne voit pas les traitement des autres utilisateurs)
- Durable : En cas de crash, même sur une opération atomique on a pas de perte de données, on reprend où on en était

BASE (Basically Available Soft state Eventual consistency) permet une cohérence faible (typique pour les systèmes `NoSQL`)

### Map reduce : une introduction rapide

Algorithme utilisé aujourd'hui. Il prend un jeu de données en entrée, le sépare en opérations fondamentales, effectue un mapping, un mélange, une réduction, et rends les résultats finaux

<!-- (Encore une fois, il explique mal et on comprend rien) -->

## Sources

- CM de Monsieur Ivan Benidi du 10/01/2022
