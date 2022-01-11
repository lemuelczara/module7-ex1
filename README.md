# SQL - Movies DB

## Create container to serve PostgreSQL database from Docker

```bash
docker run --name module7-ex1 -e POSTGRES_USER=meli -e POSTGRES_PASSWORD=docker -e POSTGRES_DB=movies -p 5432:5432 -d postgres
```

<br>

## Create and populate database

```bash
docker cp ./database.sql module7-ex1:/docker-entrypoint-initdb.d/dump.sql

docker exec -u meli module7-ex1 psql movies meli -f docker-entrypoint-initdb.d/dump.sql
```
