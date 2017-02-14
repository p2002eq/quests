function event_spawn(e)
    eq.set_timer("appearance", 1);
end

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Corporal Donfeld?");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18332})) then -- torn half of a note
        e.self:Say("I knew someone would come if I... just held out... long enough... Take these... be careful... ' And with that, Marais allows himself to finally die.");
        e.other:SummonItem(18333); -- Marais' Notes (Notes- The Recuso)
        e.other:QuestReward(e.self,0,0,0,0,18334,5000); -- Marais' Notes (Notes- Rifkin)
        e.self:SetAppearance(3);
        eq.set_timer("depop", 10);
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
    if (e.timer == "depop") then
        eq.depop_with_timer();
    elseif (e.timer == "appearance") then
        e.self:SetAppearance(3);
    end
    eq.stop_timer(e.timer)
end