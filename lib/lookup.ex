defmodule FromTheAshes.Lookup do
  alias FromTheAshes.Client

  def lookup(address) do
    with {:ok, %{body: %{"results" => [result | _]}}} <-
           Client.GoogleGeoCoding.get("json", [],
             params: %{
               key: Application.get_env(:from_the_ashes, :google_api_key),
               address: address
             }
           ),
         %{"geometry" => %{"location" => %{"lat" => lat, "lng" => long}}} <- result do
      {:ok, %{latitude: lat, longitude: long}}
    end
  end
end
