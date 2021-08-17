defmodule FeedbackAppWeb.Router do
  use FeedbackAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  pipeline :authenticated do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/api", FeedbackAppWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    post "/users/sign_in", UserController, :sign_in

    post "/sign_up", RegistrationController, :sign_up

    pipe_through :authenticated
    # resources "/feedbacks", FeedbackController, only: [:index, :create]
  end
end
