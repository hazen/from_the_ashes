defmodule FromTheAshes.Client.GoogleGeoCoding do
  use HTTPoison.Base

  #  FromTheAshes.Client.GoogleGeoCoding.get("json", [], [params: %{key: "", address: "999 18th St, Denver, CO"}])

  @base_url "https://maps.googleapis.com/maps/api/geocode/"

  def process_request_url(url) do
    @base_url <> url
  end

  def process_request_params(params) do
    Map.put(params, :key, System.get_env("GOOGLE_API_KEY"))
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
