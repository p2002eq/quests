-- female erudite spirit in Gunthak (cleric quest)

-- depop timer
function event_spawn(e)
    eq.set_timer('depop', 60 * 60 * 1000);
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.stop_timer('depop');
        eq.depop();
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");
    local qglobals = eq.get_qglobals(e.self, e.other);

    if(qglobals["Millius_Cleric"] == "2") then
        if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359030})) then -- Alina's emblem
            e.self:Emote("is surrounded by a warm glow as the ring touches her ethereal form. Her lips curl into a smile as she begins to fade away into the mist. You hear something fall to the ground. You notice a wet scroll half buried in the sand. You reach down and pick it up.");
            e.other:QuestReward(e.self,0,0,0,0,359011,eq.ExpHelper(45, 5)); -- Spell: Temperance, 5% of lvl 45 exp
            eq.delete_global("Millius_Cleric");
            eq.depop();
            reset_spawn();
        end
    else
        e.self:Emote("recoils from you. An ethereal whisper escapes her lips 'You are not the one who summoned me. . .'")
    end

    item_lib.return_items(e.self, e.other, e.trade)
end

-- death block
function event_death_complete(e)
    reset_spawn();
end

-- helper function to reset spawn
function reset_spawn()
    -- associating spirit with the spawnpoint seems to prevent the spawn point from repopping after she dies... resetting it explicitly here
    local spawnpoint = eq.get_entity_list():GetSpawnByID(1046892);
    spawnpoint:Enable();
    spawnpoint:Reset();
end
