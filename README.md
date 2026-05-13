# Projet Concert

## Prérequis
- Java 17+
- Maven
- Node.js + Angular CLI (`npm install -g @angular/cli`)
- MySQL

## Configuration de la base de données (OBLIGATOIRE)

1. Créer une base de données MySQL vide :
```sql
   CREATE DATABASE concert;
```

2. Ouvrir le fichier : concert-back/src/main/resources/META-INF/persistence.xml

3. Modifier ces lignes avec vos paramètres MySQL :
```xml
   <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/concert"/>
   <property name="javax.persistence.jdbc.user" value="VOTRE_USER"/>
   <property name="javax.persistence.jdbc.password" value="VOTRE_MOT_DE_PASSE"/>
```

## Lancement

Double-cliquer sur `start.bat`

- Frontend : http://localhost:4200
- Backend  : http://localhost:8080