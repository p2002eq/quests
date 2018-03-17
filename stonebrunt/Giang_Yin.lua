function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("looks down upon the creature standing beneath him and speaks. 'You are brave to approach a titan such as Giang Yin. I pray that the spirits have granted you honor and respect as well as courage.'");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6981})) then --Kejekan Smithy Hammer
        e.self:Say("Freeing long imprisoned spirits is a noble cause. Your hammer has our blessing to free the souls from their crystalline shadow tombs.");
        e.other:QuestReward(e.self,0,0,0,0,6979,10000); --Soulforge Hammer
        e.other:Faction(172, 2, 0); -- Kejek Villiage
        e.other:Faction(247, 1, 0); -- Peace Keepers
    end
    item_lib.return_items(e.self, e.other, e.trade);
end