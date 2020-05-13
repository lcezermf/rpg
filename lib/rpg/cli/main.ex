defmodule RPG.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press enter to continue...")
    choice_hero()
  end
  defp welcome_message do
    Shell.info("=== RPG ===")
    Shell.info("Welcome to DeltaCity.")
    Shell.info("You need to survive and find the exit.")
  end
  defp choice_hero do
    RPG.CLI.HeroChoice.start()
  end
end
