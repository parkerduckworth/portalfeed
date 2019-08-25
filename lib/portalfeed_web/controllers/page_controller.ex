defmodule PortalfeedWeb.PageController do
  use PortalfeedWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
