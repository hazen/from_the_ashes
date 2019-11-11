defmodule FromTheAshesWeb.LocationView do
  use FromTheAshesWeb, :view

  def render("index.json", %{latitude: latitude, longitude: longitude}) do
    {:ok, result} = Jason.encode(%{location: %{latitude: latitude, longitude: longitude}})
    result
  end
end
