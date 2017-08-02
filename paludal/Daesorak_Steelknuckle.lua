---- Quest:Mining Operation
function event_spawn(e)
    picks = 0;
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Lo there stranger what ya doin in ere? You know how dangerous it can be down ere! I be lucky I got some of da finest miners werkin for me. I sure do hope we get those supplies soon.");
    elseif(e.message:findi("retrieve the mining picks") and picks == 1) then
        e.self:Say("Excellent, " .. e.other:GetName() .. ". Please go see Terasol in Katta to retrieve my mining supplies. Bring him this note to show that you were sent by me. And dunt stray off track with these supplies, we needs em bad!");
        e.other:SummonItem(4754); -- A Jarbled Note
        picks = 0;
    elseif(e.message:findi("return a letter") and picks == 2) then
        e.self:Say("I thank you, " .. e.other:GetName() .. ". Without your help I doubt we would have been able to finish this project on time! Please take this to my wife Aliane back home. You can surely count on me telling the Patriarch of how much help you have been when I return home. I wish you good journeys as for me its back to work I go!");
        e.other:SummonItem(4756); -- Letter to Aliane
        picks = 0;
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4747})) then -- Bag of Rations
        e.self:Say("Ah these must be from ol Coggo! Ye see I had sent out a few men to gather some new picks an such for the mining operation ere but they haven't returned yet. I'm really in need of some picks that are being held in Katta by a friend of mine. Will you [" .. eq.say_link("retrieve the mining picks") .. "] for me?");
        e.other:Faction(154,5); -- house of stout
        e.other:Faction(338,1); -- traders of the haven
        picks = 1;
        e.other:QuestReward(e.self,0,0,0,0,0,2500); --
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4755})) then -- A Bundle of Mining Picks
        e.self:Say("Ye did it, " .. e.other:GetName() .. "! Ye hear dat boys! Dis outlander ere jess delivered us our new minin picks! You have no idea how much these supplies will aid our operation! As a final task would you be able to [" .. eq.say_link("return a letter") .. "] to me wife back home?");
        e.other:Faction(154,5); -- house of stout
        e.other:Faction(338,1); -- traders of the haven
        eq.signal(156064,1,1); -- Noppta Mottun
        eq.signal(156061,1,1); -- Overslo Herlsal
        eq.signal(156065,1,1); -- Diojb Waksom
        eq.signal(156066,1,1); -- Farlol Duriclo
        e.other:QuestReward(e.self,0,0,0,0,0,2500); --
    end
    item_lib.return_items(e.self, e.other, e.trade)
end