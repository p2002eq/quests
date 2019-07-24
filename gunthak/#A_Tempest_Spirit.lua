-- A Tempest Spirit for Icewind quest in Gunthak

-- depop timer
function event_spawn(e)
    eq.set_timer('depop', 10 * 60 * 1000);
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.stop_timer('depop');

        e.self:Emote("melts away quietly.");
        eq.depop();
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");
    if(e.other:GetClass() == 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 359041})) then -- Cracked Zraxthril Amulet
        e.self:Emote("takes the amulet from you and holds it in its watery hand. The wind around you rises and the sea begins to swell. The spirit melts into a swirling pool at your feet. You gaze down into the pool and notice it begin to shrink in circumference. It continues to shrink and spin until finally there is nothing left but a small blue amulet on the ground. You reach to pick it up and hear an echo from the sea. 'Call us and we will aid you.'");
        e.other:QuestReward(e.self,0,0,0,0,359008,eq.ExpHelper(51)); -- Spell: Icewind, ~2% exp at lvl 52
        eq.depop();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
