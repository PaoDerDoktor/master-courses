# Bases de Données non traditionnelles : Systèmes `NoSQL` - Partie II

## Cassandra

En cassandra, tous les nodes jouent le même rôle :

- Pas de `master` ni de `slave`, pas de configuration serveur -> pas de *Single Point of Failure* (``SPoF``)
- Les lignes sont éclatées ("*sharded*") parmi les nœuds du cluster
- Les lignes sont répliquées parmi les nœuds du cluster

Le paramètre ***TypolyStartegy*** définit comment et où les lignes d'un espace de clefs sont répliquées et éclatées

Les cluster de Cassandra sont décrites comme des anneaux. Chaque ligne doit posséder une clef primaire, et chaque ligne est distribuée sur les nœuds selon cette clef primaire. Les requêtes basées sur les clefs primaires sont très efficaces

Ajouter des nœuds sur un cluster est très facile (grâce aux `vnodes` implémentés depuis la version 1.2). On peut ajouter des nœuds sans arrêter le système, et l'ajout d'un nœuds entraîne automatiquement une re-répartition équitable des données su  les nœuds.

Un ``snitch`` détermine quel *data center* et quel *rack* sont écrits et lus. Ils informent Cassandra sur la topologie du réseau et lui permettent d'y distribuer les répliques en groupant des machines. Cassandra essaie un maximum de ne pas avoir plus d'une réplique sur le même rack

Les requêtes sont d'abord envoyées à l'un des nœuds (pas toujours le même, l'équilibreur de charge s'occupe de répartir les requêtes), le **coordinateur**. Le coordinateur examine les autres nœuds pour répondre à la requête, puis envoie la réponse obtenue au client demandeur.

Si un nœud crash, chacun des autres nœuds est instantanément mit au courant. Si le coordinateur est mis au courant d'un crash sur un nœud à interroger, il re-route la requête sur un autre nœud possédant la réplique de la donnée cherchée. Si le coordinateur lui-même crash, l'application affecte un autre coordinateur. Après la revenue en ligne des nœuds crashés, le coordinateur leur envoie les éventuels changements nécessaires (en cas de requête d'écriture par exemple).

La cohérence de Cassandra est réglable (``ONE``, ``LOCAL_ONE``, ``LOCAL_QUORUM``, ``QUORUM`` dans l'ordre de cohérence la plus faible à la plus haute). Un paramètre plus fort entraîne une augmentation de la latence et une baisse de la disponibilité.

Cassandra utilise le language de requête ``CQL`` (Cassandra Query Language). Il est inspiré très fortement du SQL. Il ne propose pas de jointures, d'unions, d'agrégat ni de groupement.

## MongoDB

``MongoDB`` est un système de gestion de bases de données ``NoSQL`` non-relationnel créée pour la mise à l'échelle horizontale. Il stocke des documents ``JSON`` (en format binaire), n'est pas structuré (pas de schéma) et impose une limite de 16Mo par document.

MongoDB possède une architecture maître-esclave

<!-- Rien d'intéressant ici -->

MongoDB possède de l'éclatage. Les documents sont éclatés selon une clef d'éclat (*shard key*). Le choix de la clef affecte les performances, l'efficacité et la possibilité de mise à l'échelle d'un cluster. Les éclats sont séparés sur des morceaux (*chunks*) de 64Mo.

La clef d'éclat doit : avoir une grande cardinalité, une bonne distribution, ne pas être monotone. Pour avoir de bonnes performances, la clef d'éclat doit être utilisé par des requêtes importantes.

Un morceau est une range contiguë d'éclats sur 64Mo. C'est l'unité minimale sur laquelle est effectuée l'équilibre de charge.

La cohérence est gérée d'une manière similaire à Cassandra.

## Point personnel sur le cours

Bon, honnêtement le cours n'est aujourd'hui qu'une petite présentation de différents systèmes pas super intéressants. J'ai pas particulièrement noté parce que je pense écrire une présentation plus intéressante et plus générale, qui serait à mes yeux plus utile (apprendre tous les concepts une fois, appliquer ceux dont on a besoin partout ; plutôt que de survoler rapidement des systèmes spécifiques). N'hésitez cependant pas à compléter le présent fichier !

## Sources

CM de Monsieur Ivan Bedini du 17/01/2021
