# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure Mix tasks and generators
config :foo_bank,
  ecto_repos: [FooBank.Repo]

config :foo_bank_web,
  ecto_repos: [FooBank.Repo],
  generators: [context_app: :foo_bank]

# Configures the endpoint
config :foo_bank_web, FooBankWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: FooBankWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: FooBank.PubSub,
  live_view: [signing_salt: "hyUHpv4y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
