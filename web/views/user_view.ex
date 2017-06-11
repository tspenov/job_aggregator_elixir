defmodule JobAgg.UserView do
  use JobAgg.Web, :view
  alias JobAgg.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
