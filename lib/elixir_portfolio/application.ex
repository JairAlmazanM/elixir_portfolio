defmodule ElixirPortfolio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirPortfolio.Repo,
      # Start the Telemetry supervisor
      ElixirPortfolioWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirPortfolio.PubSub},
      # Start the Endpoint (http/https)
      ElixirPortfolioWeb.Endpoint
      # Start a worker by calling: ElixirPortfolio.Worker.start_link(arg)
      # {ElixirPortfolio.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirPortfolio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirPortfolioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
