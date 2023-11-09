defmodule FooBank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FooBank.Repo,
      {DNSCluster, query: Application.get_env(:foo_bank, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FooBank.PubSub}
      # Start a worker by calling: FooBank.Worker.start_link(arg)
      # {FooBank.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: FooBank.Supervisor)
  end
end
