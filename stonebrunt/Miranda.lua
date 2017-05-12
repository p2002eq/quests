function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("I'm not supposed to talk to strangers but if my parents let you in here I guess it's ok. Do you like [candy]? I could give you some [candy] to play a game with me but my [dice] are gone now.");
    elseif(e.message:findi("candy")) then
        e.self:Say("Khonza Ayssla went away one time and came back with chocolate covered cherries and pixie powder cinnesticks for my sister and I. I like the chocolates the best.");
    elseif(e.message:findi("dice")) then
        e.self:Say("I had my dice in a little bag and lost it outside the walls of the village. I think the kobolds must have found it.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19992  })) then --Chocolate Marr Cherries
        e.self:Emote("claps her hands with excitement.");
        e.self:Say("Chocolate cherries!! My favorite!! Here try some of this!!");
        e.other:QuestReward(e.self,0,0,0,0,20115,100);  -- Pouch of Kejek Catnip
        e.other:Faction(172, 5, 0); -- Kejek Villiage
        e.other:Faction(247, 2, 0); -- Peace Keepers
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2088  })) then --Tiny Pouch of Bone Dice
        e.self:Say("You found my dice!!! Thank you!!");
        e.other:QuestReward(e.self,0,0,0,0,20116,500);  -- Ball of Burlap Yarn
        e.other:Faction(172, 5, 0); -- Kejek Villiage
        e.other:Faction(247, 2, 0); -- Peace Keepers
    end
    item_lib.return_items(e.self, e.other, e.trade);
end