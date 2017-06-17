defmodule JobAgg.Repo.Migrations.AddRemotedIdUniqueIndexJobs do
  use Ecto.Migration

  def change do
    create index(:jobs, [:remote_id], unique: true)
  end
end
