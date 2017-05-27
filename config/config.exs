# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :job_agg,
  ecto_repos: [JobAgg.Repo]

# Configures the endpoint
config :job_agg, JobAgg.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UB+3wqkZV2V4YJNKeFizs6ak44SxrdqXi+iM6fi57jW7pEgvobm8QgmIQXBkDVEb",
  render_errors: [view: JobAgg.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JobAgg.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"