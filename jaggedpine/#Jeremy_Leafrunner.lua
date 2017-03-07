---- Quest:Jeremy's Letter
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello there " .. e.other:GetName() .. ". Nice day today isn't it? We really appreciate the help that the city of Qeynos has offered us in defense of [Fort Jaggedpine].");
    elseif(e.message:findi("Fort Jaggedpine")) then
        e.self:Say("That's the name my grandfather and grandmother gave to this place a while ago. Great name don't you think? Well at least I think it is anyway. My grandmother moved away after my grandfather passed away a long time ago. Are you [planning a trip to Felwithe] any time soon?");
    elseif(e.message:findi("Felwithe")) then
        e.self:Say("Hey that's great. I don't see much of my grandmother these days, would you be [willing to deliver a letter] to her?");
    elseif(e.message:findi("letter")) then
        e.self:Say("Thanks a bunch, I really appreciate it! Here take this to her. Her name is Elishia.");
        e.other:SummonItem(8969); -- Letter to Elishia
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8970})) then -- Letter to Jeremy
        e.self:Say("Thank you very much!");
        e.other:Faction(271,10); -- Residents of Jaggedpine
        e.other:Faction(159,5); -- Jaggedpine Treefolk
        e.other:Faction(265,5); -- Protectors of Pine
        e.other:Faction(135,1); -- Guards of Qeynos
        e.other:QuestReward(e.self,0,0,0,0,0,500); -- Faction and EXP
    end
    item_lib.return_items(e.self, e.other, e.trade)
end