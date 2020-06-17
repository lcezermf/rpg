defmodule RPG.Room.Triggers.Treasure do
  alias RPG.Room.Action
  alias Mix.Shell.IO, as: Shell
  @behaviour RPG.Room.Trigger
  def run(character, %Action{id: :forward}) do
    Shell.info("You're walking cautiously and can see the next room.")
    {character, :forward}
  end

  def run(character, %Action{id: :search}) do
    healing = 5
    Shell.info("You search the room looking for something useful.")
    Shell.info("You find a treasure box with a healing potion inside.")
    Shell.info("You drink the potion and restore #{healing} hit points.")

    {
      RPG.Character.heal(character, healing),
      :forward
    }
  end
end
