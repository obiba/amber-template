run:
	docker compose pull
	docker compose build --parallel --no-cache
	docker compose up -d --remove-orphans

logs:
	docker compose logs -f

up:
	docker compose up -d --remove-orphans

stop:
	docker compose stop

down:
	docker compose down --remove-orphans