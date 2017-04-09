-- War_Trigger (166257) - invis man coordinator for Hollowshade War

-- camp 1 is north, camp 2 is east, camp 3 is south
camps = { "North", "East", "South", "Fort" };
-- race 1 is bears, race 2 is wolves, race 3 is grimlings
races = { "Owlbears", "Sonic Wolves", "Grimlings", "Vah Shir" };

function event_spawn(e)
    reset_zone();
end

function event_timer(e)
    if e.timer == 'reset' then
        reset_zone()
    elseif e.timer == 'random_attack' then
        local camp = math.random(1,3);
        do_attack(camp, determine_race(camp));
    end
end

function event_signal(e)
    -- signals below 10 are mapped in the same way as conditions - 1 is north bear, 2 is north wolf, 3 is north grim, 4 is east bear, etc
    if e.signal < 10 and not attack_in_progress then -- one of the camp leaders died
        local camp = math.floor(e.signal / 3);
        local race = parse(e.signal);
        
        eq.stop_timer('random_attack');
        if do_attack(camp, race) then -- tries to execute an attack, returns true if attack is possible (not all camps are same race)
            eq.set_timer('random_attack', 15 * 60 * 1000);
        end
    else
        
    end
end

function do_attack(tar, race)
    for i=1,2 do
        if race ~= determine_race(tar+i) then
            -- tar+i attacks tar
            event_started = 1;
            return true
        end
    end
    
    return false -- returns false if no attack happened (all camsp are same race)
end

function determine_race(camp)
    local off = (parse(camp) - 1) * 3; -- offset is 0 for north, 3 for east, 6 for south
    for i=1,3 do
        if conditions[off+i] == 1 then
            return i
        end
    end
    
    return 0 -- shouldn't normally get here
end

function reset_zone()
    -- conditions 1/2/3 are north camp (bear, wolf, grim), 4/5/6 are east camp, 7/8/9 are south camp, 10 is ???, 11/12/13 are fort - starting config is bears north, wolves east, grims south
    conditions = { 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0 };
    process_cond(conditions);
    attack_in_progress = 0;
    event_started = 0;
end

function process_cond(cond_array)
    for i, v in pairs(cond_array) do
        eq.spawn_condition("hollowshade", 0, i, v);
    end
end

function parse(num)
    -- this function rolls over numbers at a multiple of 3. i.e. 1->1, 2->2, 3->3, 4->1, 5->2, 6->3, 7->1, etc
    return ((num - 1) % 3) + 1
end
