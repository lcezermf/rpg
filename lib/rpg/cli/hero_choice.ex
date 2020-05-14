defmodule RPG.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.cmd("Start by choosing you hero:")

    heroes = RPG.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> Enum.map(&(&1.name))
    |> display_names()
    |> generate_questions()
    |> Shell.prompt()
    |> parse_answer()
    |> find_hero_by_index.()
    |> confirm_hero()
  end

  defp display_names(names) do
    names
    |> Enum.with_index(1)
    |> Enum.each(fn({name, index}) ->
      Shell.info("#{index} - #{name}")
    end)

    names
  end

  defp generate_questions(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]"
  end

  defp parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end

  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end

end
