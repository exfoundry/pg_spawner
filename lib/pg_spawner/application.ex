defmodule PgSpawner.Application do
  @moduledoc false

  use Application

  @defaults [port: 15432, pgdata: "priv/db/data"]

  @impl true
  def start(_type, _args) do
    opts = Keyword.merge(@defaults, Application.get_all_env(:pg_spawner))

    children = if opts[:pgdata], do: [{PgSpawner, opts}], else: []

    Supervisor.start_link(children, strategy: :one_for_one, name: PgSpawner.Supervisor)
  end
end
