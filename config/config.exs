# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tablex,
  ecto_repos: [Tablex.Repo]

# Configures the endpoint
config :tablex, TablexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FuhMKpgv6CfLBKDoBpaUKwoSnO74KzX0hDLbSa0ugYkCXOpEo9G9NUUnOEPUcIJs",
  render_errors: [view: TablexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tablex.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
