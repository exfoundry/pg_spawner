import Config

# Disable auto-start of PgSpawner.Application; tests start their own
# spawner instances on free ports.
config :pg_spawner, pgdata: false
