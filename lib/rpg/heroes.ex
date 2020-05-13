defmodule RPG.Heroes do
  alias RPG.Character

  def all do
    [
      %Character{
        name: "Ozob",
        description: "Palhaço replicante",
        hit_points: 70,
        max_hit_points: 90,
        attack_description: "Oia bomba",
        damage_range: 25..45
      },
      %Character{
        name: "James Rexus",
        description: "Contrabandista assassino",
        hit_points: 85,
        max_hit_points: 95,
        attack_description: "Roubo de informações",
        damage_range: 20..60
      },
      %Character{
        name: "NDR",
        description: "Android Hacker",
        hit_points: 50,
        max_hit_points: 60,
        attack_description: "Hackear",
        damage_range: 35..40
      }

    ]
  end
end
