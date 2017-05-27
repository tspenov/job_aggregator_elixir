defmodule JobAgg.PageController do
  use JobAgg.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
