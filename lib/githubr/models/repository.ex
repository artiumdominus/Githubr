defmodule Githubr.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  schema "repositories" do
    field :name, :string
    field :full_name, :string
    field :description, :string
    field :url, :string
    field :html_url, :string
    field :size, :integer
    field :stargazers_count, :integer
    field :language, :string
    field :forks, :integer
    field :open_issues, :integer
    field :watchers, :integer
    field :language_key, :string

    timestamps()
  end

  @fields [
    :name,
    :full_name,
    :description,
    :url,
    :html_url,
    :size,
    :stargazers_count,
    :language,
    :forks,
    :open_issues,
    :watchers,
    :language_key
  ]

  @doc false
  def changeset(repository, attrs) do
    
    repository
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end