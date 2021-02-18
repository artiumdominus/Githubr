defmodule GithubrWeb.RepositoryView do
  use GithubrWeb, :view

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

  defp format_number(number) do
    if number < 1000 do
      Integer.to_string number
    else
     format_number(div(number, 1000)) <> "," <> Integer.to_string(rem(number, 1000))
    end
  end
end