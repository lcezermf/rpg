defmodule RPG.Room.Triggers.EnemyHidden do
  alias RPG.Room.Action
  alias Mix.Shell.IO, as: Shell
  @behaviour RPG.Room.Trigger

  def run(character, %Action{id: :forward}) do
    Shell.info("You're walking cautiously and can see the next room.")
    {character, :forward}
  end

  def run(character, %Action{id: :rest}) do
    enemy = Enum.random(RPG.Enemies.all())
    Shell.info("You search the room for a comfortable place to rest.")
    Shell.info("Suddenly...")
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} surprises you and attacks first.")
    {_enemy, updated_char} = RPG.Battle.fight(enemy, character)

    {
      updated_char,
      :forward
    }
  end
end
