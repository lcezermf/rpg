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
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy
      },
      %Room{
        description: "There is an enemy hidden somewhere.",
        actions: [rest()],
        trigger: Triggers.EnemyHidden
      },
      %Room{
        description: "Look for a treasure",
        actions: [search()],
        trigger: Triggers.Treasure
      },
      %Room{
        description: "IT is a trap",
        actions: [search()],
        trigger: Triggers.Trap
      },
      %Room{
        description: "Take a rest",
        actions: [rest()],
        trigger: Triggers.Rest
      }
    ]
end
