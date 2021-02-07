defmodule Githubr.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :name, :string
      add :key, :string
      add :synced, :boolean

      timestamps()
    end

  end
end
