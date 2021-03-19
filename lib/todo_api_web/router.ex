defmodule TodoApiWeb.Router do
  use TodoApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/api", TodoApiWeb do
    pipe_through :api
    options "/todo/add", TodoController, :create # TODO: invistigate CORS options issues (this is looks kind of hacky)
    options "/todo/:id", TodoController, :delete # TODO: invistigate CORS options issues (this is looks kind of hacky)
    options "/todo/:id/complete", TodoController, :complete # TODO: invistigate CORS options issues (this is looks kind of hacky)
    options "/todo/:id/update", TodoController, :update # TODO: invistigate CORS options issues (this is looks kind of hacky)

    put "/todo/:id/complete", TodoController, :complete
    put "/todo/:id/update", TodoController, :update
    get "/todo/list", TodoController, :index
    post "/todo/add", TodoController, :create
    delete "/todo/:id", TodoController, :delete
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", TodoApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TodoApiWeb.Telemetry
    end
  end
end
