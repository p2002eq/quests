---- Quest:Qeynos Badge of Nobility (Badge #5)
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Yeah. Hi. Lovely place this. Humid, dark, wild animals all over the place, man eating plants, snakes and bugs finding their way into my armor and biting me where a man ought not be bit. And if [Bossamir] is right, we're soon to be cut down by ravaging gnolls. Why-oh-why did I get assigned to this job? Why wasn't I assigned to Qeynos where a man can get a decent meal and sleep in a nice bed at night? Oh I'm sorry. Did I say that out loud?");
    elseif(e.message:findi("Bossamir")) then
        e.self:Say("Hmm. . . Yeah, I have this tendency to prattle on when I'm completely miserable. According to what my colleague Bossamir has heard, these gnolls may be tougher then we thought. But that would be par for the course anyway with the way my pitiful life is going. Woe is me. The people in this backward settlement hate me, Sergeant Caelin hates me and I assume Kane hates me too because he sent me to the armpit of Antonica on a suicide mission.");
    elseif(e.message:findi("pate")) then
        e.self:Say("Oh yes! That would be great. Bring me some Pate and let me see that warning again and maybe I can actually read the whole thing without feeling faint.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8283})) then -- Official Warning
        e.self:Say("So he wants to send me to jail simply because I'm not filling out some silly reports? How can I be expected to think in such a decrepit state? Maybe you could help me. If I had a meal worthy of someone of my breeding then maybe I could think. Bring me something elegant, I don't want anything dull and pedestrian. I don't know what I want though. Do you have any suggestions?");
        e.other:QuestReward(e.self,0,0,0,0,0,1000); -- exp
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8199})) then -- Dryad Pate
        e.self:Say("I like it... but it is not quite perfect. I need a better pate. Here, you will need some brandy. This is a special blend...");
        e.other:QuestReward(e.self,0,0,0,0,8284,1000); -- Finewine Family Brandy
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8198})) then -- Potameid Pate
        e.self:Say("I like it... but it is not quite perfect. I need a better pate. Here, you will need some brandy. This is a special blend...");
        e.other:QuestReward(e.self,0,0,0,0,8284,1000); -- Finewine Family Brandy
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8278})) then -- Panther Pate
        e.self:Say("You have done well. I guess you would like the report now.");
        e.other:QuestReward(e.self,0,0,0,0,8279,1000); -- Stack of Shift Reports
    end
    item_lib.return_items(e.self, e.other, e.trade)
end