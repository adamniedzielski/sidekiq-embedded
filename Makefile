build:
	docker-compose build

install:
	docker-compose run --rm web bundle install

server:
	docker-compose run --rm --service-ports web

bash:
	docker-compose run --rm web bash
