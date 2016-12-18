docker-compose run web rails new . --force --database=postgresql --skip-bundle
docker-compose build
cp database.yml config/
docker-compose up
docker-compose run web rails db:create
