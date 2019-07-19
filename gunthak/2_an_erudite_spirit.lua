-- male erudite spirit in Gunthak (paladin quest)

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

    if e.other:GetGlobal("Millius_Paladin") == "2" then
        if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359027})) then -- Black Skull Necklace
            e.self:Emote("looks at you with piercing eyes that tear through your heart. His ethereal fingers close around the necklace. A blinding light surrounds both the necklace and the transparent figure as you shield your eyes away. When the light dies down you look to see the necklace, now softly glowing, sitting on the sand. As you pick it up you notice a wet scroll half buried in the sand beneath it. A voice echoes in your mind. 'Find him.'");
            e.other:QuestReward(e.self,0,0,0,0,359003,eq.ExpHelper(45, 5)); -- Spell: Ethereal Cleansing
            e.other:SummonItem(359028); -- Glowing Black Skull Necklace
            eq.delete_global("Millius_Paladin");
            eq.depop();
            reset_spawn();
        end
    else
        e.self:Emote("recoils from you. A whispering moan echoes towards you 'You are not the one I have returned for. . .'")
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
    local spawnpoint = eq.get_entity_list():GetSpawnByID(1047209);
    spawnpoint:Enable();
    spawnpoint:Reset();
end
