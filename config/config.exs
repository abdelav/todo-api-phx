# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todo_api,
  ecto_repos: [TodoApi.Repo],
  adapter: Ecto.Adapters.Postgres,
  username: "todo_app",
  password: "phx88316452TodoApp",
  database: "todo_api_dev",
  hostname: "localhost",
  pool_size: 10

# Configures the endpoint
config :todo_api, TodoApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YUGgNPnaidCzITXYcqAg8uZxmyH3DI8IgnlQXpJP9A1HsLvE4LzrcqPPLVW7duIN",
  render_errors: [view: TodoApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TodoApi.PubSub,
  live_view: [signing_salt: "haEO7DRQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
