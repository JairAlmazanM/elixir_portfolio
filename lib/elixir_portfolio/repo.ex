defmodule ElixirPortfolio.Repo do
  use Ecto.Repo,
    otp_app: :elixir_portfolio,
    adapter: Ecto.Adapters.Postgres
end
