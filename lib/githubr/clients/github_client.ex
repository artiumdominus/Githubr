defmodule Githubr.GitHubClient do
  @moduledoc """
  GitHub API Client
  """

  use HTTPoison.Base
  alias Githubr.Repository

  @baseurl "https://api.github.com"
  @headers [{"Content-Type", "application/json"}, {"Accept", "application/vnd.github.v3+json"}]

  def get_nice_repositories(language) do
    urn = "/search/repositories"
    uri = urn <> build_search_query(language, 10)
    
    case get uri do
      {:ok, %{status_code: 200, body: body}} ->
        {:ok,
        body
        |> Poison.decode!(as: %{"items" => [%Repository{}]})
        |> Map.fetch!("items")
        |> Enum.map(fn r -> %Repository{r | updated_at: nil} end)}
      {:ok, %{status_code: code}} -> {:error, "Status Code: #{code}"}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  defp build_search_query(language, per_page),
    do: "?q=language:#{language}&sort=stars&per_page=#{per_page}"

  # HTTPoison.Base overrides
  @spec process_url(binary) :: binary
  def process_url(url), do: @baseurl <> url

  @spec process_request_headers(term) :: [{binary, term}]
  def process_request_headers(_headers), do: @headers

  #@spec process_response_body(binary) :: term
  #def process_response_body(body), do: body |> Poison.Parser.parse!
end