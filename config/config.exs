# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_portfolio,
  ecto_repos: [ElixirPortfolio.Repo]

# Configures the endpoint
config :elixir_portfolio, ElixirPortfolioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MmJmCbDbayzXvm+DFigmTn0NeI3ARnfpyOmDKp1cfPahSI4n4uwrudl8HsLWB6xr",
  render_errors: [view: ElixirPortfolioWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirPortfolio.PubSub,
  live_view: [signing_salt: "q13lpMgu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
