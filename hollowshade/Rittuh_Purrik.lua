----
---- Need Event Logic for Hollowshade War
---- See Perl for example design
----
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Good day " .. e.other:GetName() .. " or is it evening already? I can never tell. Stock up on goods while you're here and if you see any grimlings. please. make them suffer. My husband was tortured by the grunts in the forest.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5573})) then -- A Folded Note
        e.self:Say("Come to do some work, " .. e.other:GetName() .. ".  Looks like you need to gather some rockhopper tails.  Take this backpack and fill it up");
        e.other:QuestReward(e.self,0,0,0,0,17609); -- Rough Leather Backpack
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5582})) then -- Bag of Tails
        e.self:Say("Well, look at you! You're quite the hunter. Not a bad job at all, young citizen. We can sure use a few more like you. I think a little padding of your daily report is in order considering the amount of work that you've done for us. Take this back to citizen Miann. She'll be pleased with you. I wrote it up pretty nice for you. Take care and good luck with your training.");
        e.other:Faction(132,5); -- Guardians of Shar Vahl
        e.other:QuestReward(e.self,0,0,0,0,5577);
    end
    item_lib.return_items(e.self, e.other, e.trade)
end