defmodule Githubr.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories) do
      add :name, :string
      add :full_name, :string
      add :description, :string
      add :url, :string
      add :size, :integer
      add :stargazers_count, :integer
      add :language, :string
      add :forks, :integer
      add :open_issues, :integer
      add :watchers, :integer

      timestamps()
    end
  end
end
