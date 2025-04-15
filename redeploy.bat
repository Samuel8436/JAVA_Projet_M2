@echo off
echo === Compilation du projet ===
mvn clean install

echo === Deploiement vers WildFly ===
cd C:\wildfly\wildfly-35.0.1.Final\bin
jboss-cli.bat --connect --command="deploy --force C:\wildfly-35.0.1.Final\standalone\deployments\mon-ear-1.0.ear"

echo === Fini ! ===
pause
