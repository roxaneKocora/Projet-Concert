#!/bin/bash
echo "======================================="
echo "     LANCEMENT DU PROJET CONCERT"
echo "======================================="

echo ""
echo "[1/3] Initialisation de la base de donnees..."
cd concert-back

mvn compile
if [ $? -ne 0 ]; then
    echo "ERREUR : Compilation echouee. Verifiez que le JDK est installe."
    exit 1
fi

mvn exec:java -Dexec.mainClass="fr.istic.taa.jaxrs.jpa.JpaTest"
if [ $? -ne 0 ]; then
    echo "ERREUR : La creation du schema a echoue."
    echo "Verifiez les parametres dans concert-back/src/main/resources/META-INF/persistence.xml"
    exit 1
fi

echo ""
echo "[2/3] Lancement du backend sur http://localhost:8080 ..."
mvn exec:java -Dexec.mainClass="fr.istic.taa.jaxrs.RestServer" > /dev/null 2>&1 &

echo ""
echo "[3/3] Lancement du frontend sur http://localhost:4200 ..."
cd ../concert-front
npm install && echo "" | ng serve > /dev/null 2>&1 &

echo ""
echo "======================================="
echo " Frontend : http://localhost:4200"
echo " Backend  : http://localhost:8080"
echo "======================================="