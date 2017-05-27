defmodule JobAgg.Job do
  use JobAgg.Web, :model
  alias JobAgg.Tag
  alias JobAgg.Repo

  schema "jobs" do
    field :title, :string
    field :description, :string
    field :company, :string
    field :apply_url, :string
    field :source_name, :string
    field :source_url, :string
    field :date_added, :utc_datetime

    timestamps()

    many_to_many :tags, Tag, join_through: "jobs_tags", on_replace: :delete
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  # def changeset(struct, params \\ %{}) do
  #   struct
  #   |> cast(params, [:title, :description, :company, :apply_url, :source_name, :source_url])
  #   |> validate_required([:title, :description, :company, :apply_url, :source_name, :source_url])
  # end

  def changeset(struct, params \\ %{}) do
    struct
    |> Repo.preload(:tags)
    |> cast(
      params,
      [:title, :date_added, :company, :description, :apply_url, :source_name, :source_url]
    )
    |> put_assoc(:tags, parse_tags(params))
  end

  defp parse_tags(%{"tags" => tags})  do
    (tags || "")
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(& &1 == "")
    |> insert_and_get_all()
  end

  defp parse_tags(%{tags: tags})  do
    tags = tags || []

    tags
    |> insert_and_get_all()
  end

  defp parse_tags(_), do: []

  defp insert_and_get_all([]) do
    []
  end
  defp insert_and_get_all(names) do
    maps = Enum.map(names, &%{name: &1, inserted_at: Ecto.DateTime.utc, updated_at: Ecto.DateTime.utc})
    Repo.insert_all(Tag, maps, on_conflict: :nothing)
    query = from t in Tag, where: t.name in ^names
    Repo.all(query)
  end
end
