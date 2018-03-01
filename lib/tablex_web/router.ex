defmodule TablexWeb.Router do
  use TablexWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", TablexWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", HomeController, :index)
    get("/:table_name", HomeController, :show)
  end

  # Other scopes may use custom stacks.
  # scope "/api", TablexWeb do
  #   pipe_through :api
  # end
end
