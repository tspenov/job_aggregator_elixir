defmodule JobAgg.Router do
  use JobAgg.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug JobAgg.Auth, repo: JobAgg.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JobAgg do
    pipe_through :browser # Use the default browser stack

    get "/", JobController, :index
    post "/jobs/fetch_go_remote", JobController, :fetch_go_remote
    resources "/jobs", JobController
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes()
  end

  # Other scopes may use custom stacks.
  # scope "/api", JobAgg do
  #   pipe_through :api
  # end
end
