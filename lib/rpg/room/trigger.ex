defmodule RPG.Room.Trigger do
  alias RPG.Character
  alias RPG.Room.Action

  @callback run(Character.t(), Action.t()) :: {Character.t(), atom}
end
