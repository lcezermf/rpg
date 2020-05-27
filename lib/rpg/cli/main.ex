defmodule RPG.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press enter to continue...")

    crawl(hero_choice(), RPG.Room.all())
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue...")
    Shell.cmd("clear")

    rooms
    |> Enum.random()
    |> RPG.CLI.RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_action_result()
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}) do
    Shell.info("You found the exit. You won the game. Congratulations!")
  end

  defp handle_action_result({character, _}) do
    crawl(character, RPG.Room.all())
  end

  defp welcome_message do
    Shell.info("=== RPG ===\n")
    Shell.info("Welcome to DeltaCity")
    Shell.info("You need to survive and find the exit. \n")
  end

  defp hero_choice do
    RPG.CLI.HeroChoice.start()
  end
end
