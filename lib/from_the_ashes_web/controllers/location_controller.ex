defmodule FromTheAshesWeb.LocationController do
  use FromTheAshesWeb, :controller

  def index(conn, _params) do
    {:ok, binary, _conn_info} = Plug.Conn.read_body(conn)

    with {:ok, %{"address" => address}} <- Jason.decode(binary),
         {:ok, %{latitude: latitude, longitude: longitude}} <- FromTheAshes.Lookup.lookup(address) do
      render(conn, "index.json", latitude: latitude, longitude: longitude)
    else
      _other ->
        IO.inspect(_other)

        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(500, "Internal Error")
    end
  end
end
