defmodule JobAgg.Repo.Migrations.AddRemoteIdToJobs do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :remote_id, :string
    end
  end
end
