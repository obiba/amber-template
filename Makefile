help:
	@echo make: stop, up, run [pull, build and up], update [stop and run], log, prune

update: stop run

run: build up

log:
	docker compose logs -f $(service)

build:
	docker compose pull
	docker compose --progress=plain build --pull --no-cache $(service)

up:
	docker compose up -d --remove-orphans

stop:
	docker compose stop

build-test:
	docker compose -f docker-compose-test.yml pull
	docker compose -f docker-compose-test.yml build --pull --progress=plain --no-cache $(service)

stop-test:
	docker compose -f docker-compose-test.yml stop

up-test:
	docker compose -f docker-compose-test.yml up -d --remove-orphans

#down:
#	docker compose down --remove-orphans

prune:
	docker system prune
