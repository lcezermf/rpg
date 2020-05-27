defmodule RPG.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import RPG.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.cmd("Start by choosing you hero:")

    heroes = RPG.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> display_options()
    |> generate_question()
    |> Shell.prompt()
    |> parse_answer()
    |> find_hero_by_index.()
    |> confirm_hero()
  end

  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end
end
