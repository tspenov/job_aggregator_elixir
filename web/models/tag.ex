defmodule JobAgg.Tag do
  use JobAgg.Web, :model
  alias JobAgg.Job

  schema "tags" do
    field :name, :string

    timestamps()

    many_to_many :jobs, Job, join_through: "jobs_tags"
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
