
postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank
dropdb:
	docker exec -it postgres dropdb simple_bank

migrateup:
	migrate --path db/migration --database "postgres://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose up

migratedown:
	migrate --path db/migration --database "postgres://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose down

migrateup1:
	migrate --path db/migration --database "postgres://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose up 1

migratedown1:
	migrate --path db/migration --database "postgres://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose down 1

sqlc:
	docker run --rm -v C:\Users\Falco\Desktop\go:/src -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...
server:
	go run main.go
mock:
	mockgen --package mockdb -destination db/mock/store.go com.falco.go/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migratedown migrateup1 migratedown1 test server mock