defmodule GithubrWeb.RepositoryController do
  use GithubrWeb, :controller

  alias Githubr.{Repo, GitHubClient, Language}

  def index(conn, params) do
    IO.inspect params

    changeset = Language.changeset(%Language{}, %{})

    languages = Repo.all(Language)

    languages_select = languages
    |> Enum.filter(fn l -> not l.synced end)
    |> Enum.map(fn l -> [key: l.name, value: l.id] end)

    languages_menu = languages
    |> Enum.filter(fn l -> l.synced end)

    render(conn, "index.html",
      changeset: changeset,
      languages_select: languages_select,
      languages_menu: languages_menu)

  end

  def sync(conn, %{"language" => %{"key" => language_id}}) do
    language = Repo.get(Language, language_id)

    case GitHubClient.get_nice_repositories language.key do
      {:ok, repositories} ->
        repositories |> Enum.each(fn r -> Repo.insert(r) end)

        Language.changeset(language, %{synced: true}) |> Repo.update

        redirect conn, to: Routes.repository_path(conn, :index)
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect to: Routes.repository_path(conn, :index)
    end
  end
end