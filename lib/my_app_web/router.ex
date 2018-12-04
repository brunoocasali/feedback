defmodule FeedbackAppWeb.Router do
  use FeedbackAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FeedbackAppWeb do
    pipe_through :api
  end
end
