# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Githubr.Repo.insert!(%Githubr.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Githubr.{Repo, Language}

[
  {"C", "c"},
  {"C++", "cpp"},
  {"C#", "csharp"},
  {"Objective-C", "obj-c"},
  {"Swift", "swift"},
  {"Java", "java"},
  {"Groovy", "groovy"},
  {"Scala", "scala"},
  {"Python", "python"},
  {"Ruby", "ruby"},
  {"JavaScript", "js"},
  {"TypeScript", "ts"},
  {"Go", "go"},
  {"Erlang", "erlang"},
  {"Elixir", "elixir"},
]
|> Enum.each(fn {name, key} ->
  Repo.insert(%Language{name: name, key: key, synced: false})
end)