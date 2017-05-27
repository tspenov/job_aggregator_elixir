use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :job_agg, JobAgg.Endpoint,
  secret_key_base: "cvYPLiJvM7OSc09IxkFIX4S3X83xB5ZWmXhpVF5uAkP/Roip6IejbYZWY5NDXDhg"

# Configure your database
config :job_agg, JobAgg.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "job_agg_prod",
  pool_size: 20
