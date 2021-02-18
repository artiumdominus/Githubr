defmodule Githubr.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories) do
      add :name, :string
      add :full_name, :string
      add :description, :text
      add :url, :string
      add :html_url, :string
      add :size, :integer
      add :stargazers_count, :integer
      add :language, :string
      add :forks, :integer
      add :open_issues, :integer
      add :watchers, :integer
      add :language_key, :string

      timestamps()
    end
  end
end
