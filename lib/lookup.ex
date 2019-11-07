defmodule FromTheAshes.Lookup do
  alias VoyageOfDiscovery.Client

  def lookup(address) do
    with {:ok, %{body: %{"results" => [result | _]}}} <-
           Client.GoogleGeoCoding.get("json", [],
             params: %{
               key: Application.get_env(:from_the_ashes, :google_api_key),
               address: address
             }
           ),
         %{"geometry" => %{"location" => %{"lat" => lat, "lng" => long}}} <- result,
         {:ok, encoded} <- Jason.encode(%{latitude: lat, longitude: long}) do
      {:ok, encoded}
    end
  end
end
