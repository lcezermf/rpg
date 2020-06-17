defmodule RPG.Room.Triggers.Rest do
  alias RPG.Room.Action
  alias Mix.Shell.IO, as: Shell
  @behaviour RPG.Room.Trigger
  def run(character, %Action{id: :forward}) do
    Shell.info("You're walking cautiously and can see the next room.")
    {character, :forward}
  end

  def run(character, %Action{id: :rest}) do
    healing = 3
    Shell.info("You search the room for a comfortable place to rest.")
    Shell.info("After a little rest you regain #{healing} hit points.")

    {
      RPG.Character.heal(character, healing),
      :forward
    }
  end
end
