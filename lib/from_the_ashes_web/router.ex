defmodule FromTheAshesWeb.Router do
  use FromTheAshesWeb, :router

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

  # Other scopes may use custom stacks.
  scope "/api", FromTheAshesWeb do
    pipe_through :api

    get "/lookup", LocationController, :index
  end

  scope "/", FromTheAshesWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    # get "/location/:messenger", HelloController, :show
  end
end
