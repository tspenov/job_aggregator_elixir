defmodule JobAgg.Repo do
  use Ecto.Repo, otp_app: :job_agg
  use Scrivener, page_size: 10
end
