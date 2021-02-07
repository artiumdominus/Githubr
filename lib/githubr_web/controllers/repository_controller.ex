defmodule GithubrWeb.RepositoryController do
  use GithubrWeb, :controller
  require Ecto.Query
  import Ecto.Query

  alias Githubr.{Repo, GitHubClient, Language, Repository}

  def index(conn, params) do
    changeset = Language.changeset(%Language{}, %{})

    languages = Repo.all(Language)

    {active_language_key, repositories} = case Map.fetch(params, "language") do
      {:ok, language_key} ->
        {language_key,
         (Repo.all from r in Repository, where: r.language_key == ^language_key)}
      :error ->
        {nil, []}
    end

    render(conn, "index.html",
      changeset: changeset,
      languages: languages,
      active_language_key: active_language_key,
      repositories: repositories)
  end

  def sync(conn, %{"language" => %{"key" => language_id}}) do
    language = Repo.get(Language, language_id)

    case GitHubClient.get_nice_repositories language.key do
      {:ok, repositories} ->
        repositories
        |> Enum.map(fn r -> %Repository{r | language_key: language.key} end)
        |> Enum.each(fn r -> Repo.insert(r) end)

        Language.changeset(language, %{synced: true}) |> Repo.update

        redirect conn, to: Routes.repository_path(conn, :index, %{language: language.key})
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: Routes.repository_path(conn, :index))
    end
  end
end