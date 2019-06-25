function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359027})) then -- Black Skull Necklace
        e.self:Emote("looks at you with piercing eyes that tear through your heart. His ethereal fingers close around the necklace. A blinding light surrounds both the necklace and the transparent figure as you shield your eyes away. When the light dies down you look to see the necklace, now softly glowing, sitting on the sand. As you pick it up you notice a wet scroll half buried in the sand beneath it. A voice echoes in your mind. 'Find him.'");
        e.other:SummonItem(359003); -- Spell: Ethereal Cleansing
        e.other:QuestReward(e.self,0,0,0,0,359028,10000); -- Glowing Black Skull Necklace
        eq.depop_with_timer();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end