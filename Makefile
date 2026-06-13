run: build up

logs:
	docker compose logs -f

pull:
	docker compose pull
	
up:
	docker compose up -d --remove-orphans

stop:
	docker compose stop

down:
	docker compose down --remove-orphans