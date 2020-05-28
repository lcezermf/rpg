defmodule RPG.Room.Triggers.Enemy do
  @behaviour RPG.Room.Trigger
  alias Mix.Shell.IO, as: Shell

  def run(character, %RPG.Room.Action{id: :forward}) do
    enemy = Enum.random(RPG.Enemies.all())
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You were prepared and attack first.")
    {updated_char, _enemy} = RPG.Battle.fight(character, enemy)
    {updated_char, :forward}
  end
end
