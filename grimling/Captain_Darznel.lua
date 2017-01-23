----
---- WIP - Requires Grimling War
---- WIP - Not ready for test or use
----

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Welcome to the Royal Coin and Mint of Shar Vahl. His majesty King Raja Kerrath guarantees all deposits in his benevolence. We also have storage available for your gear. Please rest assured that your treasured items are safe with us.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8471})) then -- Garrison Enlistment Forms
        e.self:Say("'Let's see, yes... yes... It looks like you signed everything in the correct spot. That can only mean that you're not only brave, but you have some wits as well. If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
        e.self:Say("Take this Polished Acrylia Sphere and give it to Scout Husman. He's been leading raiding parties against the grunt camps. Adventures are great, but we need a real soldier to assist him this time. Perhaps we will get better results with your help.");
        e.self:Say("After you complete that raid, please go with Scouts Danarin and Derrin. Once you secure those camps, bring me any grimling intelligence reports or documents that you may have found. Place the documents and your Garrison Cloak in this bag and bring them back to me. Complete this task and you may even get a promotion.");
        e.other:SummonItem(3681): -- Polished Acrylia Sphere
        e.other:QuestReward(e.self,0,0,0,0,4397,10000); -- Soldiers Chest
    end
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8475})) then -- Soldier's chest
        e.self:Say("");
        e.other:SummonItem(8412); -- Dar Khura Garrison Cloak
        e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
    end
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8488})) then -- Box of War Trophies
        e.self:Say("");
        e.other:SummonItem(8409); -- Jharin Garrison Cloak
        e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
    end
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8490})) then -- Box of War Trophies
        e.self:Say("");
        e.other:SummonItem(8411); -- Khala Dun Garrison Cloak
        e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
    end
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8491}) and (e.other:Class() == "beastlord")) then -- Box of War Trophies
        e.self:Say("");
        e.other:SummonItem(8410); -- Khati Sha Garrison Cloak
        e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms

    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8491})) then -- Box of War Trophies
        e.self:Say("");
        e.other:SummonItem(8413); -- Taruun Garrison Cloak
        e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
    end
    item_lib.return_items(e.self, e.other, e.trade)
end