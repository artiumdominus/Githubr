defmodule GithubrWeb.RepositoryView do
  use GithubrWeb, :view

  defp select(languages) do
    languages
    |> Enum.filter(fn l -> not l.synced end)
    |> Enum.map(fn l -> [key: l.name, value: l.id] end)
  end

  defp menu(languages) do
    languages |> Enum.filter(fn l -> l.synced end)
  end

  defp split(repositories) do
    repositories
    |> Enum.with_index
    |> Enum.split_with(fn {_, i} -> rem(i, 2) == 0 end)
    |> Tuple.to_list
    |> Enum.map(fn x -> x |> Enum.map(fn {r, _} -> r end) end)
  end
end