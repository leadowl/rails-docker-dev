appName=$1
if [ -z "$1" ] 
  then appName="ror-app"
fi
echo "Using "$appName" as appname and "$UID" as ROR_UID."
docker-compose run -e ROR_UID=${UID} -e APPNAME=${appName} web rails new . --force --database=postgresql --skip-bundle
docker-compose build
sed "s/ror-app/$appName/g" database.yml > config/database.yml
docker-compose up
