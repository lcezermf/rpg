defmodule RPG.Enemies do
  alias RPG.Character

  def all do
    [
      %Character{
        name: "Ogre",
        description: "A large creature. Big muscles. Angry and hungry.",
        hit_points: 150,
        max_hit_points: 180,
        damage_range: 13..15,
        attack_description: "a hammer"
      },
      %Character{
        name: "Orc",
        description: "A green evil creature. Wears armor and an axe.",
        hit_points: 88,
        max_hit_points: 92,
        damage_range: 12..14,
        attack_description: "an axe"
      },
      %Character{
        name: "Goblin",
        description: "A small green creature. Wears dirty clothes and a dagger.",
        hit_points: 54,
        max_hit_points: 84,
        damage_range: 21..32,
        attack_description: "a dagger"
      }
    ]
  end
end
