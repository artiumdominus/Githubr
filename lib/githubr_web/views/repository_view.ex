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

  defp title(full_name) do
    full_name
    |> String.split("/")
    |> Enum.join(" / ")
  end

  defp description(description) do
    if description == nil or String.length(description) <= 60 do
      description
    else
      String.slice(description, 0, 55) <> "..."
    end
  end

  defp format_number(number) do
    if number < 1000 do
      Integer.to_string number
    else
     format_number(div(number, 1000)) <> "," <> Integer.to_string(rem(number, 1000))
    end
  end
end