defmodule Email do
  use Bamboo.Phoenix, view: JobAgg.EmailView

  def welcome_text_email(email_address) do
    new_email()
    |> to(email_address)
    |> from("jobagg@example.com")
    |> subject("Welcome!")
    |> text_body("Welcome to JobAgg!")
  end
end
