# rest-api

## Api

articles という記事の CRUD ができる API

### db reset

```bash
$ docker compose exec api bash
$ rails db:migrate:reset
$ rails db:seed
```

<br/><br/>

## Swagger

swagger の UI

http://localhost:3001/

http://localhost:3001/swagger.json で swagger の json を取得可能
