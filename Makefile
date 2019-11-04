up:
	docker run --rm -p 5432:5432 -v "${PWD}/data:/data" --name postgres_phx -e PGDATA=/data -d postgres:9.6.13

down:
	docker stop postgres_phx
