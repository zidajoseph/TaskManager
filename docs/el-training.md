## À propos de ce programme

Ce document est un programme de formation pour les nouveaux employés afin d'apprendre les bases de Ruby on Rails et de ses technologies périphériques, qui sont essentielles pour Manyo.
Quelle que soit la capacité des nouveaux employés, vous devrez effectuer une étape.
La période de formation n'est pas précisée.
La formation sera terminée lorsque toutes les étapes seront terminées.

Ce programme suppose les caractères suivants.

--Nouvel employé : Un étudiant de ce programme.
--Supporter: Nous fournissons une éducation, des conseils et des conseils aux nouveaux employés. Il joue également un rôle de concertation avec les nouveaux collaborateurs et de définition ensemble des cahiers des charges.

C'est au supporter de décider dans quelle mesure il est impliqué dans l'orientation. De plus, en ce qui concerne la période de formation, les accompagnateurs établiront à l'avance une ligne directrice tenant compte du niveau de compétence des nouveaux employés et de l'état des projets internes.

## Aperçu

### Configuration requise

Dans ce programme, il vous sera demandé de développer un système de gestion des tâches en tant que problème.
Le système de gestion des tâches souhaite effectuer les opérations suivantes :

――Je veux facilement enregistrer ma tâche
--Je veux pouvoir définir une date d'expiration pour une tâche
--Je veux prioriser les tâches
--Je veux gérer le statut (non démarré / démarré / terminé)
--Je veux affiner les tâches par statut
--Je veux rechercher une tâche par nom de tâche / description de tâche
--Je veux lister les tâches. Je veux trier sur l'écran de liste (en fonction de la priorité, de la date d'expiration, etc.)
――Je veux classer les tâches avec des étiquettes, etc.
--Je souhaite m'inscrire en tant qu'utilisateur afin de ne voir que les tâches que j'ai enregistrées.

Nous souhaitons également que les fonctions de gestion suivantes répondent aux exigences ci-dessus.

--Fonction de gestion des utilisateurs

### Navigateur d'assistance

--Le navigateur de support est supposé être la dernière version de macOS / Chrome

### À propos de la configuration de l'application (serveur)

J'aimerais que vous construisiez en utilisant les langages et middleware suivants (les deux sont les dernières versions stables).

--Rubis
--Rubis sur rails
--PostgreSQL

Pour le serveur, veuillez utiliser ce qui suit.

--Heroku

- Les exigences de performance et les exigences de sécurité ne sont pas spécifiées, mais veuillez faire avec une qualité générale.
  Si le site ne répond pas trop, merci de l'améliorer.

## Objectif ultime de ce programme

À la fin de ce programme, il est supposé que vous apprendrez les éléments suivants.

--Être capable de mettre en œuvre des applications Web de base en utilisant Rails
--Une application Rails peut publier une application en utilisant un environnement général
--Fonctions supplémentaires et maintenance des données pour les applications Rails publiées
--Apprenez le flux des relations publiques et de la fusion sur GitHub. Apprenez également les commandes Git requises pour cela.
--Être capable de s'engager avec une granulométrie appropriée
Être capable de rédiger correctement une description de relations publiques
--Être capable de répondre aux avis et d'apporter des corrections
--Être capable de poser des questions aux membres de l'équipe et aux parties liées (cette fois, je serai un supporter) verbalement ou discuter au bon moment.

## Livres recommandés

Nous recommandons les livres suivants comme livres recommandés pour faire progresser le programme de formation.

-[Guide pratique d'apprentissage rapide Ruby on Rails 5 pouvant être utilisé sur le terrain] (https://book.mynavi.jp/ec/products/detail/id=93905)

Le guide pratique d'apprentissage rapide Ruby on Rails 5 qui peut être utilisé sur le terrain se concentre sur le système de gestion des tâches ainsi que sur le programme de formation.
Par conséquent, je pense qu'il y a beaucoup de points qui peuvent être utiles pour faire avancer cette formation.

Il explique également ce qui n'a pas été couvert dans cette formation et comment procéder au développement de l'équipe. Veuillez vous y référer.

## Collection de sujets utile pour le développement

Les sujets dont j'aimerais que vous profitiez sont résumés dans topics.md, bien qu'ils n'aient pas été inclus dans les étapes spécifiques du problème. Veuillez vous y référer et l'utiliser si nécessaire lors de la mise en œuvre du programme.

## Étapes du défi

### Étape 1 : Construire un environnement de développement Rails

#### 1-1 : Installer Ruby

-Utilisez [rbenv] (https://github.com/rbenv/rbenv) pour installer la dernière version de Ruby.
--Vérifiez que la version Ruby est affichée avec la commande `ruby -v`

#### 1-2 : Installation des rails

--Installer les rails avec la commande Gem
--Veuillez installer la dernière version de Rails
--Vérifiez que la version Rails est affichée avec la commande `rails -v`

#### 1-3 : Installation de la base de données (PostgreSQL)

--Installons PostgreSQL sur votre système d'exploitation
--Pour macOS, veuillez installer avec `brew` etc.

### Étape 2 : Créer un référentiel sur GitHub

--Installez Git à portée de main
--Pour macOS, veuillez installer avec `brew` etc.
--Enregistrez votre nom d'utilisateur et votre adresse e-mail avec `gitconfig`
-- Pensons au nom de l'application (= nom du référentiel)
--Créons un référentiel
--Si vous n'avez pas de compte, obtenez-en un
--Créons un dépôt vide dessus

### Étape 3 : Créer un projet Rails

--Créez le minimum de répertoires et de fichiers requis pour votre application avec la commande `rails new`
--Créez un répertoire appelé `docs` directement sous le répertoire du projet (répertoire du nom de l'application) créé par` rails new` et validez ce fichier de document.
Ceci permet de garder les spécifications de cette application sous contrôle afin que vous puissiez les voir à tout moment.
--Poussons l'application créée vers le référentiel créé sur GitHub
--Afin de spécifier la version, décrivez la version de Ruby à utiliser dans `Gemfile` (assurez-vous que Rails a déjà la version).

### Étape 4 : Pensez à l'image de l'application que vous souhaitez créer

――Avant de concevoir, réfléchissons à l'image complète (avec les supporters) du type d'application que ce sera. La conception de l'écran par prototypage papier est recommandée
――Réfléchissons à la manière dont cette application sera utilisée (si elle sera publiée sur Internet, pour un usage interne, etc...) (avec les supporters).
--Lisez la configuration système requise et réfléchissez à la structure de données dont vous avez besoin
――Quel type de modèle (table) semble être nécessaire ?
Quel type d'informations est nécessaire dans le tableau ?
Si vous pensez à la structure des données, écrivons-la à la main sur le diagramme du modèle.
――Une fois terminé, prenez une photo et placez-la dans le référentiel.
--Ecrivez le schéma de la table dans `README.md` (nom du modèle, nom de la colonne, type de données)

- Il n'est pas nécessaire de créer le bon diagramme de modèle pour le moment. Faisons-le comme une hypothèse pour le moment (imaginez le réparer si vous pensez que c'est faux dans les étapes futures)

### Étape 5 : Configurons la connexion à la base de données (paramètres périphériques)

--Tout d'abord, coupons une nouvelle branche thématique avec Git
――Après cela, nous allons travailler sur la branche thématique et commiter.
--Installer le bundle
--Installez `pg` (pilote de base de données PostgreSQL) avec` Gemfile`
--Définissons `database.yml`
--Créez une base de données avec la commande `rails db: create`
-- Vérifions la connexion à la base de données avec la commande `rails db`
--Créer un PR sur GitHub pour examen
Si nécessaire, utilisez WIP (Work In Progress) pour émettre un PR. Veuillez vous référer à la collection de sujets pour plus de détails.
Si vous avez des commentaires, veuillez répondre en conséquence. Si vous avez 2 LGTM (Looks Good To Me), fusionnez-les dans la branche master.

### Étape 6 : Configurer RuboCop

--Définir RuboCop comme Linter/Formateur
--Dans ce cursus, nous utiliserons [retrieva-cop] (https://github.com/retrieva/retrieva-cop) dont les modalités ont été ajustées en fonction de la création de l'application Rails.
--Installez [retrieva-cop] (https://github.com/retrieva/retrieva-cop) avec `Gemfile`
--Introduire Circle CI pour exécuter RuboCop lors de la création d'un PR
Peu importe si le supporter l'implémente compte tenu du niveau de difficulté.
――Après cela, mettons à jour les conventions de codage selon les besoins en consultation avec les supporters et les réviseurs.

### Étape 7 : Créons un modèle de tâche

Créer CRUD pour gérer les tâches.
Tout d'abord, créons-le avec une structure simple où seuls le nom et les détails peuvent être enregistrés.

--Créez la classe de modèle requise pour le CRUD des tâches avec la commande `rails generate`
--Créer une migration et l'utiliser pour créer une table
Il est important de s'assurer que la migration peut être ramenée à l'état précédent ! Prenez l'habitude de jouer à « refaire » pour vérifier
--N'oubliez pas de définir également des restrictions de base de données.
--Assurez-vous que vous pouvez vous connecter à la base de données via le modèle avec la commande `rails c`
--À ce stade, essayons de créer un enregistrement avec ActiveRecord.
--Définissons la validation
-- Réfléchissons à quelle validation doit être ajoutée à quelle colonne
--Créer un PR sur GitHub pour examen

### Étape 8 : Autoriser l'affichage/l'enregistrement/la mise à jour/la suppression des tâches

Créons un écran de liste de tâches, un écran de détail, un écran de création, un écran de modification et une fonction de suppression.

La création de ces fonctionnalités en même temps a tendance à rendre le PR énorme.
Par conséquent, à l'étape 8, nous allons procéder avec PR en le divisant en plusieurs parties.

Dans les étapes futures, si le PR est susceptible d'augmenter, déterminez si vous pouvez émettre le PR en deux ou plus.

### Étape 8-1 : Créons un écran de liste de tâches et un écran de détail

--Permettons d'afficher la tâche créée à l'étape 7 sur l'écran de liste et l'écran de détail.
--Créez des contrôleurs et des vues avec la commande `rails generate`
Décidons quel moteur de modèle utiliser en consultation avec les supporters.
--Ajoutez les implémentations requises pour votre contrôleur et visualisez
--Modifiez `routes.rb` pour que l'écran de la liste des tâches s'affiche à`http: // localhost: 3000 /`
-- Expliquons aux supporters quel type de traitement est effectué entre le navigateur Web et le serveur.
--Créer un PR sur GitHub pour examen

### Étape 8-2 : Créons un écran de création de tâche et un écran d'édition

--Soyons capables de créer et de modifier des tâches à partir de l'écran
--Affichons un message flash à l'écran après la création et la mise à jour.
--Si une erreur de validation se produit, affiche un message d'erreur à l'écran.
--Créer un PR sur GitHub pour examen

### Étape 8-3 : Pouvons-nous supprimer la tâche

--Soyons capables de supprimer la tâche créée
--Affichons un message flash sur l'écran après la suppression
--Créer un PR sur GitHub pour examen

### Étape 8-4 : Revenons au code ajouté

-- Expliquons le code ajouté aux étapes 8-1 à 8-3 aux supporters.
--À propos des classes, des méthodes et des variables
--À propos du flux de traitement

### Étape 9 : Entrons en contact avec SQL

--Exploitons la base de données
--Connectons-nous à la base de données avec la commande `rails db`
--Afficher, créer, mettre à jour et supprimer des tâches dans SQL
--Accédez à l'écran de la liste des tâches et vérifiez que le journal SQL circule.
Expliquons aux supporters quel type de SQL est exécuté.
-- Vérifions quel type de SQL est exécuté par la méthode d'ActiveRecord
--Exécutons `find`,` where`, etc. avec `rails c`

### Étape 10 : Rédigez un test

--Préparez-vous à écrire la spécification
--Préparez `spec / spec_helper.rb`,` spec / rails_helper.rb`
--Écrivons une spécification de modèle pour validation
En fait, je n'écris pas beaucoup de tests de validation, mais faisons-le pour approfondir la compréhension des spécifications du modèle.
--Écrivons une spécification système pour la fonction de tâche
--Intégrer RSpec avec Circle CI et notifier Slack
--Semblable à l'étape 6, cela peut être fait par les supporters.
--Livre de référence : https://leanpub.com/everydayrailsrspec-jp

### Étape 11 : Standardisons la partie japonaise de l'application

--Utilisons le mécanisme i18n de Rails pour afficher les messages d'erreur de validation en japonais.

### Étape 12 : Définissez votre fuseau horaire Rails

--Définir le fuseau horaire Rails au Japon (Tokyo)

### Étape 13 : Trier la liste des tâches par ordre de date et d'heure de création

--Actuellement, ils sont triés par ordre d'ID, mais trions-les par ordre décroissant de date et d'heure de création.
-- Écrivons dans la spécification du système que le tri fonctionne bien.

### Étape 14 : Déployons

--Maintenant que vous avez un système de gestion de tâches simple dans la branche master, déployons-le.
--Déployons sur Heroku
--Si vous n'avez pas de compte, créez-en un
--Touchons l'application déployée sur Heroku
――À partir de maintenant, enregistrons les tâches dans cette application et procédons au développement.
-\* Cependant, les applications Heroku peuvent être référencées n'importe où sur Internet, veuillez donc ne pas publier d'informations qui ne sont pas bonnes pour la publication.
--L'authentification de base peut être incluse à ce stade
À l'avenir, déployons en continu votre application sur Heroku après chaque étape
--Décrivons la méthode de déploiement dans `README.md`
――À ce moment-là, il est encore mieux d'inclure les informations de version du framework utilisé dans cette application.

### Étape 15 : Ajoutez une date d'expiration

--Permettons d'enregistrer une date d'expiration pour une tâche
--Soyons capables de trier par date d'expiration sur l'écran de liste
--Développons la spécification
Si vous publiez et obtenez un avis, publions-le

### Étape 16 : Ajoutez un statut pour le rendre consultable

--Ajoutons le statut (pas commencé / commencé / terminé) -[Option] Si vous n'êtes pas débutant, vous pouvez installer une Gem qui gère l'état.
--Permettons la recherche par titre et statut sur l'écran de liste -[Option] Si vous n'êtes pas un débutant, vous pouvez installer un Gem qui facilite la mise en œuvre de la recherche telle que le saccage.
--Lors de la réduction, vérifions les modifications apportées au SQL émis en consultant le journal.
Prenez l'habitude de vérifier au besoin dans les étapes suivantes
--Coller l'index de recherche
--Préparez une certaine quantité de données de test, vérifiez le fonctionnement en regardant log / development.log, et confirmez que l'ajout d'un index améliore la vitesse. -[Option] Vérifions l'état d'utilisation de l'index du côté de la base de données à l'aide de PostgreSQL Explain, etc.
--Ajoutons une spécification de modèle à la recherche (développons également la spécification du système)

### Étape 17 : Définir les priorités (\* Peut être omis si vous avez une expérience de mise en œuvre similaire)

--Permettons d'enregistrer des priorités (élevées, moyennes, faibles) pour les tâches
--Trions par priorité
--Développons les spécifications du système
Si vous publiez et obtenez un avis, publions-le (veuillez continuer)

### Étape 18 : Ajoutons la pagination

--Ajoutons la pagination à l'écran de liste en utilisant une gemme appelée Kaminari

### Étape 19 : Devinez le design

--Introduisez Bootstrap et appliquez votre conception aux applications que vous avez créées jusqu'à présent -[Option] Écrivez et concevez votre propre CSS

### Étape 20 : Créons un modèle utilisateur

--Créons un modèle utilisateur
--Créons le premier utilisateur avec seed
--Lions la tâche avec le premier utilisateur créé avec seed
--Indexons l'association
-\* Lors du déploiement sur Heroku, assurez-vous que la tâche déjà enregistrée est liée à l'utilisateur (maintenance des données).

### Étape 21 : implémenter la fonctionnalité de connexion/déconnexion

--Implémentons-le vous-même sans utiliser de gemmes supplémentaires
--En n'utilisant pas Gem tel que Devise, le but est d'approfondir votre compréhension du mécanisme tel que les cookies HTTP et Session in Rails.
――Le but est également d'approfondir votre compréhension de l'authentification générale (telle que la gestion des mots de passe).
--Implémentons un écran de connexion
--Si vous n'êtes pas connecté, assurez-vous que vous ne pouvez pas accéder à la page de gestion des tâches.
--Lorsque vous créez une tâche, associons la tâche à l'utilisateur connecté.
--Affichons uniquement les tâches que vous avez créées
--Implémentons la fonction de déconnexion

### Étape 22 : Implémentons l'écran de gestion des utilisateurs

-- Ajoutons un menu de gestion à l'écran
--Assurez-vous d'ajouter l'URL `/admin` au début de l'écran de gestion.
--Avant d'ajouter à `routes.rb`, concevons en supposant à l'avance l'URL et le nom de routage (nom qui devient` * _path`).
--Mettons en œuvre la liste d'utilisateurs / créer / mettre à jour / supprimer
--Après avoir supprimé un utilisateur, essayez de supprimer les tâches de l'utilisateur.
--Affichons le nombre de tâches que l'utilisateur a sur l'écran de la liste des utilisateurs.
--Incorporer un mécanisme pour éviter le problème N+1
--Voyons la liste des tâches créées par l'utilisateur

### Étape 23 : Ajoutons un rôle à l'utilisateur

--Faisons une distinction entre les utilisateurs administratifs et les utilisateurs généraux
--Rendons l'écran de gestion des utilisateurs accessible uniquement à l'utilisateur de gestion
--Faisons une exception spéciale lorsqu'un utilisateur général accède à l'écran de gestion
--Attrapez l'exception et affichez la page d'erreur de manière appropriée (vous pouvez le faire à l'étape 25)
--Permettons de sélectionner un rôle sur l'écran de gestion des utilisateurs
--Contrôlons la suppression afin qu'aucun utilisateur administratif ne soit perdu
--Utilisons le rappel du modèle
-\* Vous pouvez utiliser ou ne pas utiliser Gem librement.

### Étape 24 : Pouvons étiqueter les tâches

--Permettons de mettre plusieurs étiquettes sur une tâche
Permettons la recherche par l'étiquette attachée

### Étape 25 : Définissez correctement la page d'erreur

--Faisons de la page d'erreur par défaut fournie par Rails l'écran que vous avez créé.
--Définir la page d'erreur de manière appropriée en fonction de la situation
--Deux types de paramètres de code d'état, page 404 et page 500, sont requis au moins.

## Post-scriptum

Je vous remercie pour votre travail acharné.
Vous avez terminé le programme éducatif !!

Je ne pouvais pas le couvrir dans ce programme, mais je pense que les sujets suivants seront nécessaires à l'avenir, donc je pense que c'est une bonne idée de continuer l'apprentissage (je pense que vous apprendrez souvent à travers des projets).

--Approfondir une compréhension de base des applications Web
--Comprendre HTTP et HTTPS
--Apprendre une utilisation un peu plus avancée de Rails
--IST
--Enregistrement
--Transaction explicite
--Traitement asynchrone
--Pipeline d'actifs (plutôt un sujet de version)
--Une compréhension plus avancée des frontends tels que JavaScript et CSS
--Approfondissez votre compréhension de la base de données
--SQL
Construire des requêtes qui mettent l'accent sur les performances
—— Approfondissez votre compréhension de l'indice
--Plus de compréhension de l'environnement du serveur
--Linux OS
--Paramètres du serveur Web (Nginx)
--Paramètres du serveur d'applications (Licorne)
--Comprendre les paramètres liés à PostgreSQL
--Comprendre les outils liés à la libération
--Capistrano
--Ansible