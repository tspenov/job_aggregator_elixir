defmodule JobAgg.SessionController do
  use JobAgg.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => user, "password" =>
                                     pass}}) do
    case JobAgg.Auth.login_by_email_and_pass(conn, user, pass, repo:
                                               Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: job_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> JobAgg.Auth.logout()
    |> redirect(to: job_path(conn, :index))
  end
end
