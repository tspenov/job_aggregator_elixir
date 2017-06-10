defmodule JobAgg.Router do
  use JobAgg.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JobAgg do
    pipe_through :browser # Use the default browser stack

    get "/", JobController, :index
    resources "/jobs", JobController
  end


  # Other scopes may use custom stacks.
  # scope "/api", JobAgg do
  #   pipe_through :api
  # end
end
