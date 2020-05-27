defmodule RPG.Room do
  alias __MODULE__
  alias RPG.Room.Triggers

  import RPG.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all,
    do: [
      %Room{
        description: "You found a quiet place, looks safe for a little nap.",
        actions: [forward()],
        trigger: Triggers.Exit
      }
    ]
end
