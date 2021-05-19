-include .env

create:
	docker-compose run --rm next npm install create-next-app
	docker-compose run --rm next npx create-next-app ${COMPOSE_PROJECT_NAME} --template typescript

up:
	docker-compose up -d

build:
	docker-compose build --no-cache --force-rm
	@make up

down:
	docker-compose down

restart:
	@make down
	@make build

# よく使うpackageをインストール(Docker内)
template:
	cd ${COMPOSE_PROJECT_NAME} \
	&& npm install @types/react-redux @types/redux-logger --save-dev