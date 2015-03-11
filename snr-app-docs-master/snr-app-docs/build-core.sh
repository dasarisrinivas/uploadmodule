cd /per-proj/projects/mwl-platform/snr-mwl-server/snr-app-docs
echo '**********************************************'
echo 'Building docs-Start-->domain-docs-Start'
cd snr-app-docs-domain
mvn clean install deploy
echo 'Building domain-Finish'
echo '**********************************************'
echo 'Building utils-docs-Start'
cd ../snr-app-docs-utils
mvn clean install deploy
echo 'Building utils-docs-End'
echo '**********************************************'
echo 'Building db-docs-Start'
cd ../snr-app-docs-db
mvn clean install deploy
echo 'Building db-docs-End'
echo '**********************************************'
echo 'Building services-docs-Start'
cd ../snr-app-docs-services
mvn clean install deploy package
echo 'Building services-docs-End'
echo '**********************************************'
echo 'Building docs-End'
echo '**********************************************'
