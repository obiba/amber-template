run: build up

logs:
	docker compose logs -f

build:
	docker compose pull
	docker compose build --pull --parallel --no-cache

up:
	docker compose up -d --remove-orphans

stop:
	docker compose stop

down:
	docker compose down --remove-orphans