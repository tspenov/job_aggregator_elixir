use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :job_agg, JobAgg.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :job_agg, JobAgg.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "postgres://localhost:5432/job_agg_test",
  pool: Ecto.Adapters.SQL.Sandbox
