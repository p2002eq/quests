---- Quest:Duke Norfin's Delivery
function event_say(e)
    fac = e.other:GetFaction(e.self);
    if(fac <= 5) then
        if(e.message:findi("hail")) then
            e.self:Say("Hello, " .. e.other:GetName() .. ". My guards seem to find you harmless enough, but I have yet to determine if you are trustworthy. We are always on the lookout for additional hands to assist in our work. Perhaps you are... sympathetic to our [situation].");
        elseif(e.message:findi("situation")) then
            e.self:Say("Those blasted Houses in Shadow Haven. They think they have the right to own all trade going through the Haven. Well it's about time they learn that trade will continue with or without their consent. I know a few people on the Trade Commission who understand the way things really [work] and they don't care who does the trading as long as they get their cut.");
        elseif(e.message:findi("work")) then
            e.self:Say("Excellent! We like to keep changing who we use for deliveries. Keeps those dumb Defenders guessing and reduces the chances of goods not reaching their [destination].");
        elseif(e.message:findi("destination")) then
            e.self:Say("I have an important shipment coming from Katta Castellum that's late. The courier who was picking up the shipment should still be there. I'd like for you to go over there and see what the hold up is. Take this note and show it to Jarin Lorean so he knows you're on official business. Report back to me with news. Better yet, return with the shipment if you can.");
            e.other:SummonItem(19841); -- Note to Jarin
        else
            e.self:Say("You have a lot of nerve wandering in here. We'll be watching you carefully. Try anything and it will be the last thing you ever try.");
        end
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19840})) then -- Smuggled Goods
        e.self:Say("Excellent work. I'm glad you were able to collect this shipment. The buyers were getting anxious to have it delivered. Come back later and I may have another job for you.");
        e.other:Faction(141,10); -- haven smugglers
        e.other:Faction(191,2); -- lake recondite bandits
        e.other:Faction(152,-12); -- house of fordel
        e.other:Faction(153,-12); -- house of midst
        e.other:Faction(154,-12); -- house of stout
        e.other:SummonItem(); --
        e.other:QuestReward(e.self,0,0,0,0,0,10000); -- Faction and EXP
    end
    item_lib.return_items(e.self, e.other, e.trade)
end