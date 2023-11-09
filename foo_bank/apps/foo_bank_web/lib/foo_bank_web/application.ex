defmodule FooBankWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FooBankWeb.Telemetry,
      # Start a worker by calling: FooBankWeb.Worker.start_link(arg)
      # {FooBankWeb.Worker, arg},
      # Start to serve requests, typically the last entry
      FooBankWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FooBankWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FooBankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
