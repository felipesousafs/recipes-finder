# Recipes finder

### How to run:
```
docker-compose build
docker-compose up
```
###### If you don't want to use docker, you can run the following commands:

```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```


##### Search feature developed using [pg_search](https://github.com/Casecommons/pg_search). Customizations to pg_search were made taking [this article](https://pablo-curell-mompo.medium.com/understanding-and-tweaking-pg-search-62c125b2ded1) as reference.

