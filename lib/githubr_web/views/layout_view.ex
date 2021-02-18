defmodule GithubrWeb.LayoutView do
  use GithubrWeb, :view

  defp select(languages) do
    languages
    |> Enum.filter(fn l -> not l.synced end)
    |> Enum.map(fn l -> [key: l.name, value: l.id] end)
  end

  defp menu(languages) do
    languages |> Enum.filter(fn l -> l.synced end)
  end
end
