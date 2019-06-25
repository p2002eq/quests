function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359030})) then -- Alina's emblem
        e.self:Emote("is surrounded by a warm glow as the ring touches her ethereal form. Her lips curl into a smile as she begins to fade away into the mist. You hear something fall to the ground. You notice a wet scroll half buried in the sand. You reach down and pick it up.");
        e.other:QuestReward(e.self,0,0,0,0,359011,10000); -- Spell: Temperance
        eq.depop_with_timer();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end