function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359032})) then -- Stone Emblem
        e.self:Emote("cringes as you lean forward, but visibly relaxes as it recognizes the stone in your hand. You place the stone emblem into the clasp on the collar. The collar begins to glow softly and the beast begins to look much healthier. he struggles to his feet and looks at you for a moment. He then lets out a great howl that echoes in the caverns. He moves towards you and nuzzles your hand. You reach forward and run you fingers across his head. As your fingers cross the collar, the wolf winks out of existence, leaving you holding only only the softly glowing collar.");
        e.other:QuestReward(e.self,0,0,0,0,359033,1000); -- Glowing Collar
    end
    item_lib.return_items(e.self, e.other, e.trade)
end