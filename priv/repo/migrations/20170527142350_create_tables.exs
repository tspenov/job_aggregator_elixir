defmodule JobAgg.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :date_added, :utc_datetime
      add :company, :string
      add :description, :text
      add :apply_url, :text
      add :source_name, :string
      add :source_url, :text
      timestamps()
    end

    create table(:tags) do
      add :name, :string
      timestamps()
    end

    create unique_index(:tags, [:name])

    create table(:jobs_tags, primary_key: false) do
      add :job_id, references(:jobs)
      add :tag_id, references(:tags)
    end
  end
end
