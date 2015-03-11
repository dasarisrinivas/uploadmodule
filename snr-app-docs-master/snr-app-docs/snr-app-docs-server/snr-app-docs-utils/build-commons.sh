cd snr-mwl-domain
mvn clean install deploy
cd ../snr-mwl-commons
mvn clean install deploy
cd ../snr-mwl-db
mvn clean install deploy -U -DskipTests=true
cd ../snr-mwl-services
mvn clean install deploy -U -DskipTests=true
cd ../../snr-mwl-api
mvn clean install package -U -DskipTests=true

