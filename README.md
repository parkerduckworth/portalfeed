# PortalFeed


Elixir implementation of GeeFeed, with a GraphQL API


## Get Elixir:
  * Install [kiex](https://github.com/taylor/kiex), a version manager (similar to rbenv)
  * Run `kiex install 1.6.6`, then `kiex use 1.6.6`


## Download Phoenix generator:
```bash
mix local.hex --force && \
mix local.rebar --force && \
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```

## Configure Postgres:
  * Add a `SUPERUSER` named `postgres` with password `postgres` (or change the config in `config/dev.exs`)


## Migrate and build:
  * Run `mix deps.get` to pull down dependencies
  * Run `mix ecto.setup` to seed your db and run migrations


## Run it:
  * Run `mix phx.server` to start the local server
  * Navigate to http://0.0.0.0:4000/api/graphiql and run some queries!


## Docs:

  * Elixir: https://hexdocs.pm/elixir/1.6.0
  * Mix: https://hexdocs.pm/mix
  * Phoenix: https://hexdocs.pm/phoenix
  * Absinthe: https://hexdocs.pm/absinthe
