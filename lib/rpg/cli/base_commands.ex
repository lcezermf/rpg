defmodule RPG.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]\n"
  end

  def parse_answer!(answer) do
    case Integer.parse(answer) do
      :error ->
        raise RPG.CLI.InvalidOptionError
      {option, _} ->
        option - 1
    end
  end

  def find_option_by_index!(index, options) do
    Enum.at(options, index) || raise RPG.CLI.InvalidOptionError
  end

  def ask_for_index(options) do
    try do
      options
      |> display_options()
      |> generate_question()
      |> Shell.prompt()
      |> Integer.parse()

    rescue
      e in RPG.CLI.InvalidOptionError ->
        display_error(e)
        ask_for_option(options)
    end
  end

  def display_error(e) do
    Shell.cmd("clear")
    Shell.error(e.message)
    Shell.prompt("Press enter to continue...")
    Shell.cmd("clear")
  end

  def ask_for_option(options) do
    index = ask_for_index(options)
    chosen_option = Enum.at(options, index)

    chosen_option || (display_invalid_option() && ask_for_option(options))
  end

  def display_invalid_option do
    Shell.cmd("clear")
    Shell.error("Invalid option")
    Shell.prompt("Press Enter to try again")
    Shell.cmd("clear")
  end
end
