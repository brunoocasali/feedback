defmodule FeedbackAppWeb.Router do
  use FeedbackAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FeedbackAppWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    post "/users/sign_in", UserController, :sign_in
  end
end
