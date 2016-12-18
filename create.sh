docker-compose run web rails new . --force --database=postgresql --skip-bundle -e ROR_UID=${UID} -e APPNAME=$1
docker-compose build
cp database.yml config/
docker-compose up
docker-compose run web rails db:create
