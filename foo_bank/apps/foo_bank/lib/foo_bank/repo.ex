defmodule FooBank.Repo do
  use Ecto.Repo,
    otp_app: :foo_bank,
    adapter: Ecto.Adapters.Postgres
end
