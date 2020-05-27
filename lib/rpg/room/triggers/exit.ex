defmodule RPG.Room.Triggers.Exit do
  @behaviour RPG.Room.Trigger

  def run(character, _), do: {character, :exit}
end
