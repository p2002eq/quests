-- War_Trigger (166257) - invis man coordinator for Hollowshade War

camps = { "North", "East", "South", "Vah Shir" };
races = { "Owlbears", "Sonic Wolves", "Grimlings", "Vah Shir" };

function event_spawn(e)
    reset_zone();
end

function event_timer(e)
    if e.timer == 'reset' then
        reset_zone()
    end
end

function reset_zone()
    -- conditions 1/2/3 are north camp (bear, wolf, grim), 4/5/6 are east camp, 7/8/9 are south camp, 11/12/13 are fort - starting config is bears north, wolves east, grims south
    conditions = { 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0 };
    process_cond(conditions);
    attack_in_progress = 0;
end

function process_cond(cond_array)
    for i, v in pairs(cond_array) do
        eq.spawn_condition("hollowshade", 0, i, v);
    end
end

