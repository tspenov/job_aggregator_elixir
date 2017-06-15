defmodule Crawlers.GoRemote do
  alias JobAgg.Job
  alias JobAgg.Tag
  alias JobAgg.Repo

  @job_site "https://goremote.io/api/jobs/"
  @source "go_remote"

  def fetch do
    HTTPoison.get!(@job_site).body
      |> Poison.decode!()
      |> Enum.map(&insert_job/1)
  end

  def insert_job(data) do
    params = %{
      title: data["position"],
      date_added: data["dateadded"],
      company: data["companyname"],
      description: data["description"],
      apply_url: data["applyurl"],
      source_name: data["sourcename"],
      source_url: data["sourceurl"],
      remote_id: @source <> data["jobid"],
      tags: tags(data["tags"])
    }
    Repo.insert!(Job.changeset(%Job{}, params))
  end

  defp tags(tags) when is_list(tags) do
    tags
  end

  defp tags(tags) when is_map(tags) do
    tags |> Map.values
  end
end
