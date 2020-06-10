defmodule RPG.Battle do
  alias RPG.Character
  alias Mix.Shell.IO, as: Shell

  def fight(
        char_a = %{hit_points: hit_points_a},
        char_b = %{hit_points: hit_points_b}
      )
      when hit_points_a == 0 or hit_points_b == 0,
      do: {char_a, char_b}

  def fight(char_a, char_b) do
    char_b_after_damage = attack(char_a, char_b)
    char_a_after_damage = attack(char_b_after_damage, char_a)
    fight(char_a_after_damage, char_b_after_damage)
  end

  defp attack(%{hit_points: 0}, receiver), do: receiver

  defp attack(attacker, receiver) do
    damage = Enum.random(attacker.damage_range)
    receiver_after_damage = Character.take_damage(receiver, damage)

    attacker
    |> attack_message(damage)
    |> Shell.info()

    receiver_after_damage
    |> receive_message(damage)
    |> Shell.info()

    receiver_after_damage
  end

  defp attack_message(character = %{name: "You"}, damage) do
    "You attack with #{character.attack_description} " <>
      "and deal #{damage} damage."
  end

  defp attack_message(character, damage) do
    "#{character.name} attacks with " <>
      "#{character.attack_description} and " <>
      "deals #{damage} damage."
  end

  defp receive_message(character = %{name: "You"}, damage) do
    "You receive #{damage}. Current HP: #{character.hit_points}."
  end

  defp receive_message(character, damage) do
    "#{character.name} receives #{damage}. " <>
      "Current HP: #{character.hit_points}."
  end
end
