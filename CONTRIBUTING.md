# Contribution au projet

## Qui peut contribuer ?

Ce dépôt est dédié aux étudiants du master informatique de l'unicaen et est donc destiné à être édité par ces mêmes étudiants, mais peut dans les faits être édité par n'importe qui faisant une Pull Request respectant les normes ci-après.

## De quoi ais-je besoin ?

Vous aurez besoin d'un éditeur de texte et de [git](https://github.com/git-guides/install-git).

## Style de code

- Tout document de cours doit être, pour le moment, en Markdown
- Dans le futur et selon les discussions, le format pourrait être revu en LaTeX
- Les fichiers Markdown doivent suivre [ces règles](https://github.com/DavidAnson/markdownlint/blob/v0.24.0/doc/Rules.md), définies pour [Markdown lint](https://github.com/DavidAnson/markdownlint/tree/v0.24.0).
  - Vous pouvez utiliser ``Markdown Lint`` pour bien former vos fichiers markdown
- Pour les mathématiques, écrivez comme vous écririez du `LaTeX`. par exemple :

        [texte markdown]
        
        $$
        [maths LaTeX]
        $$
        
        [texte markdown]

## Nomenclature des branches et commits

La branche principale du dépôt est la branche `master`. Elle ne doit pour l'instant contenir que des fichiers complets

Chaque **branche** doit suivre l'une des nomenclatures suivantes:

- ``convert/[LANGAGE]`` pour la conversion depuis le `Markdown` vers le langage en question, si l'on décide par exemple un jour de passer au ``LaTeX``
- ``wip/[PSEUDO]`` pour les rédactions en cours, avec le pseudonyme du contributeur concerné

Chaque **commit** doit suivre les règles suivantes :

- Chaque commit doit être décrit en français après le préfixe
- La description d'un commit doit être préfixée de la manière suivante :
  - ``add:`` ajout d'un ou plusieurs fichiers
  - ``del:`` effacement d'un ou plusieurs fichiers
  - ``fuse:`` fusion de fichiers
  - ``typo:`` correction de fautes
  - ``meta:`` modification de fichiers gits (gitignore, readme, ...) ou de dossiers
  - ``append:`` ajout d'informations à un fichier
  - ``sources:`` ajout de sources à un fichier
  - ``pics:`` ajout d'illustrations à un fichier
  - ``conv:`` conversion d'un fichier
  - ``other:`` tout le reste

## Structure d'un fichier Markdown

Chaque fichier markdown doit :

- Posséder un en-tête de forme ``# [Nom du Cours] : [Thème abordé] - [numéro]``
- Indiquer en dernière section (de niveau 2) ses sources. Si les sources sont es CMs, il faut l'y préciser.
- Posséder une hiérarchie des titres claire et permettant de se retrouver dans le document

## Règles de rédaction

Voici quelques règles de rédaction, pour l'instant non-vérifiées par le linter :

- Faites le moins de fautes d'orthographe, de conjugaison et de grammaire possible, pour garder le document lisible
- N'hésitez pas à découper le document en sous-parties si besoin
- Ne sous-estimez pas l'intérêt des mots en **gras** et en *italique* : ils aident à la compréhension
  - Notre standard pour l'italique est l'astérisque simple : ``*exemple*``
  - Notre standard pour le gras est l'astérisque double : ``**exemple**``
  - Privilégiez le gras pour le plus important

## Organisation du dépôt

La structure du dépôt est aujourd'hui un peu improvisée. Sa structure est vouée à changer pour accueillir d'autres sections ou être épurée selon les besoins

Chaque fichier de cours doit être placé dans un dossier portant le nom de sa matière. Aidez-vous d'[ecampus](https://ecampus.unicaen.fr/) si besoin. Chaque fichier doit se nommer de la façon suivante : ``[Thème abordé]-[numéro].md``

Si d'aventure vous souhaitez ajouter un fichier qui n'est pas en rapport avec les cours de la fac mais avec un sujet sur lequel vous souhaitez écrire : vous êtes plus que bienvenue ! Mettez-le dans le dossier ``./Ecrits Etudiants`` !

## Merci

En participant à ce dépôt, vous soutenez directement une communauté étudiante qui a tendance à passer par de très mauvais moments par ces temps-ci.

Ce dépôt, s'il est alimenté, aidera certainement pour les révisions ; et peut-être même, pour certains, à aller un peu plus loin que les simples enseignements de la fac.

Merci à vous !!
