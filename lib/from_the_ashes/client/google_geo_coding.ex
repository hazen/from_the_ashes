defmodule FromTheAshes.Client.GoogleGeoCoding do
  use HTTPoison.Base

  #  VoyageOfDiscovery.Client.GoogleGeoCoding.get("json", [], [params: %{key: "", address: "999 18th St, Denver, CO"}])

  @base_url "https://maps.googleapis.com/maps/api/geocode/"

  def process_request_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    case Jason.decode(body) do
      {:ok, json} -> json
      _ -> body
    end
  end

  def process_response_header(headers) do
    headers
  end
end
