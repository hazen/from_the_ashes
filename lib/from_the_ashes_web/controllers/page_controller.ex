defmodule FromTheAshesWeb.PageController do
  use FromTheAshesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
