defmodule FromTheAshesWeb.LocationControllerTest do
  use FromTheAshesWeb.ConnCase

  test "GET /api/lookup", %{conn: conn} do
    {:ok, request} = Jason.encode(%{"address" => "denver, co"})

    conn =
      conn
      |> put_req_header("content-type", "application/json")
      |> get("/api/lookup", request)

    assert json_response(conn, 200) =~
             "{\"location\":{\"latitude\":39.7392358,\"longitude\":-104.990251}}"
  end
end
