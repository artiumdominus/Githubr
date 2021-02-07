defmodule Githubr.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :key, :string
    field :name, :string
    field :synced, :boolean

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:name, :key, :synced])
    |> validate_required([:name, :key, :synced])
  end
end
