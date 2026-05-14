# 🎵 Nom du Projet : ConcertApp

## Description du projet

Il s'agit d'une application web de billetterie en ligne dédiée à la gestion et à la vente de billets pour des événements (concerts, spectacles, etc.).
L'application s'adresse à trois types d'utilisateurs :

- Les clients peuvent parcourir le catalogue d'événements disponibles et acheter leurs billets directement en ligne.
- Les managers peuvent gérer leurs événements : dates, lieux, capacités, tarifs, etc.
- Les administrateurs gèrent l'ensemble des utilisateurs de la plateforme (validation, suspension, suppression de comptes, etc.).

---

## Prérequis

- Java 17+
- Maven
- Node.js + npm
- Angular CLI → `npm install -g @angular/cli`
- MySQL

---

## Clonage du projet

Ce dépôt utilise des **Git Submodules**. Cloner avec :

```bash
git clone --recurse-submodules <url-du-repo>
```

Si vous avez déjà cloné et que les dossiers `concert-back` et `concert-front` sont vides :

```bash
git submodule update --init --recursive
```

---

## Configuration de la base de données (OBLIGATOIRE)

- Créer une base de données vide nommée **concert_db** dans MySQL.
- Si votre configuration MySQL est différente (port, host, identifiants), ouvrez le fichier `concert-back/src/main/resources/META-INF/persistence.xml` et modifiez votre config :

```xml
<property name="hibernate.connection.password" value="VOTRE_MOT_DE_PASSE"/>
<property name="hibernate.connection.url" value="jdbc:mysql://localhost:3306/concert_db"/>
<property name="hibernate.connection.username" value="VOTRE_USER"/>
```

---

## Lancement du projet

**Sous Windows** — double-cliquer sur `start.bat`

**Sous Mac/Linux**, dans le terminal :

```bash
chmod +x start.sh
./start.sh
```

| Service | URL |
|---------|-----|
| Application | http://localhost:4200 |
| Swagger (doc API) | http://localhost:8080/swagger-api/ |

---

## Connexion

- Il n'y a qu'une seule URL pour le front : **http://localhost:4200**

- Le dashboard affiché est automatiquement adapté selon le rôle de l'utilisateur connecté (Super Admin, Admin, Manager, Client).

- Seul le compte Super Admin est généré automatiquement au démarrage :

| Email | Mot de passe | Rôle |
|-------|-------------|------|
| `admin@concert.com` | `admin123` | Super Admin |

- Le Client s'inscrit lui-même via l'interface. Le Manager est créé par un Admin, et c'est le Manager qui crée les événements.

NB : Seuls les concerts dont la date est postérieure à la date du jour sont affichés.

---

## Documentation détaillée

Pour la description complète du projet: le modèle métier, les règles de gestion et les endpoints,le diagramme de classe se référer au README du backend :
`concert-back/README.md`