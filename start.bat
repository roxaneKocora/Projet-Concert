@echo off
echo =======================================
echo     LANCEMENT DU PROJET CONCERT
echo =======================================

echo.
echo [1/3] Initialisation de la base de donnees...
cd concert-back
call mvn compile
if %errorlevel% neq 0 (
    echo ERREUR : Compilation echouee. Verifiez que le JDK est installe.
    pause
    exit /b 1
)

call mvn exec:java -Dexec.mainClass="fr.istic.taa.jaxrs.jpa.JpaTest"
if %errorlevel% neq 0 (
    echo ERREUR : La creation du schema a echoue.
    echo Verifiez les parametres dans concert-back\src\main\resources\META-INF\persistence.xml
    pause
    exit /b 1
)

echo.
echo [2/3] Lancement du backend sur http://localhost:8080 ...
start "Backend - Concert API" cmd /k "mvn exec:java -Dexec.mainClass=fr.istic.taa.jaxrs.RestServer"

echo.
echo [3/3] Lancement du frontend sur http://localhost:4200 ...
cd ..\concert-front
start "Frontend - Concert App" cmd /k "npm install && ng serve"

echo.
echo =======================================
echo  Frontend : http://localhost:4200
echo  Backend  : http://localhost:8080
echo =======================================
pause