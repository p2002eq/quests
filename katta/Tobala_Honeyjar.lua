---- Quest: Fertilizer & Rare Plants
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Hello, " .. e.other:GetName() .. "! I am Governess Tobala Honeyjar of Katta Castellum. Overseeing the maintenance of the [" .. eq.say_link("Nocturnal Gardens") .. "] is just one of my duties as the governess of agriculture and ecology.");
    elseif(e.message:findi("nocturnal gardens")) then
        e.self:Say("These are the Nocturnal Gardens in which we now stand. It is a collection of flora from various regions of the dark side of Luclin. It is a shame that we are not capable of supplying the nutrients necessary to maintain flora from the light side of Luclin. If you wish to assist in the maintenance of the garden I have some [" .. eq.say_link("tasks") .. "] you may be helpful in completing.");
    elseif(e.message:findi("tasks")) then
        e.self:Say("I am in need of ingredients to create more [" .. eq.say_link("fertilizer") .. "] and in need of a competent forager to gather some [" .. eq.say_link("rare plants") .. "] for me.");
    elseif(e.message:findi("fertilizer")) then
        e.self:Say("How humble of you to assist me with my mundane tasks! Take this bag and fill it with Three piles of Owlbear Dung, Three Piles of Fungus Compost, and Two Piles of Netherbian Nitrate.");
        e.other:SummonItem(17870); -- Empty Fertilizer Bag
    elseif(e.message:findi("rare plants")) then
        e.self:Say("I am seeking seeds and plants that I may extract the seeds from that are native to the light side of Luclin so that I am prepared should the Illuminarium Industria succeed in constructing a lantern that will provide the plants with the nutrients they need to survive here on the dark side. It would be a tremendous help if you could bring me a Twilight Orchid, Dawnflower Seeds, a Red Sands Cactus, and a Letalis Zenith Vine.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31779})) then -- Full Fertilizer Bag
        e.self:Say("Oh! Thank you so much! You have saved much time and trouble! Now if only those tinkerers in the Illuminarium Industria could figure out how to get that artificial light working!");
        e.other:Faction(52,2); -- Concillium Universus
        e.other:Faction(142,-1); -- Heart of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:QuestReward(e.self,0,0,0,0,12809,1000); -- Midnight Tangelo
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14936, item2 = 14931, item3 = 14952, item4 = 14953})) then -- Twilight Orchid, Dawnflower Seeds, Red Sands Cactus & Letalis Zenith Vine
        e.self:Say("Oh! Thank you so much! You have saved much time and trouble! Now if only those tinkerers in the Illuminarium Industria could figure out how to get that artificial light working!");
        e.other:Faction(52,2); -- Concillium Universus
        e.other:Faction(142,-1); -- Heart of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:QuestReward(e.self,0,0,0,0,10695,1000); -- Foraging Machette
    end
    item_lib.return_items(e.self, e.other, e.trade)
end