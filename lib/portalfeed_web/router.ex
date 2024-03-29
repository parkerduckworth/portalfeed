defmodule PortalfeedWeb.Router do
  use PortalfeedWeb, :router

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

  scope "/", PortalfeedWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PortalfeedWeb.Schema,
      interface: :simple,
      context: %{pubsub: PortalfeedWeb.Endpoint}
  end
end
