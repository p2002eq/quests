-- War_Trigger (166257) - invis man coordinator for Hollowshade War

camps = { "North", "East", "South", "Vah Shir" };
races = { "Owlbears", "Sonic Wolves", "Grimlings", "Vah Shir" };

function event_spawn(e)
    eq.spawn_condition(hollowshade, 0, 7, 0);
end
