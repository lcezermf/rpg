defmodule RPG.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.cmd("Start by choosing you hero:")

    RPG.Heroes.all()
    |> Enum.map(&(&1.name))
    |> display_names
  end

  defp display_names(names) do
    names
    |> Enum.with_index(1)
    |> Enum.each(fn({name, index}) ->
      Shell.info("#{index} - #{name}")
    end)

    names
  end
end
