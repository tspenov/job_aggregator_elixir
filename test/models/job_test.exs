defmodule JobAgg.JobTest do
  use JobAgg.ModelCase

  alias JobAgg.Job

  @valid_attrs %{apply_url: "some content", company: "some content", description: "some content", source_name: "some content", source_url: "some content", title: "some content"}
  # @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Job.changeset(%Job{}, @valid_attrs)
    assert changeset.valid?
  end

  # test "changeset with invalid attributes" do
  #   changeset = Job.changeset(%Job{}, @invalid_attrs)
  #   refute changeset.valid?
  # end
end
