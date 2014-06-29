-- Quest for 51058 Kyralynn in Lakerathe - Shaman Totemic Armor (low 30's armor)
-- Kiladiveus - completed subevents for this NPC quest.  I created the ending statement since i can't find any. Same as exp.
-- Kiladiveus - In OOT, need to add loot "19035 Driftwood pipe" into "69148 isle goblin chieftan" need also to create lootdrop ID.
-- Kiladiveus - In southkarana, need to add loot "19044 Grizzleknot Bark" into "14142 Grizzleknot" with 100% probability. Npc already a rare spawn.


function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. "! I am the shaman Kyralynn. If you have a banded armor, my husband Vrynn and I can form it into a new shaman armor using this totem and some reagents for the ritual. I can use a banded [bracer], [mail], [helm] or [cloak] to form this new armor.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("The bracer requires a banded bracer, 1 dufrenite, a cauldron shell from an aqua goblin lord in Dagnor's Cauldron, and a bull elephant tooth.");
	elseif(e.message:findi("helm")) then
		e.self:Say("The helm requires a banded helm, 1 ground dufrenite, a glacier bear pelt, and an ogreskin chamois from a lizard page.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("The cloak requires a banded cloak, 1 powdered dufrenite, basalt drake scales, and a driftwood pipe from an isle goblin chieftain.");
	elseif(e.message:findi("mail")) then
		e.self:Say("The mail requires banded mail, 1 crushed dufrenite, a lancer swordfish fin, and Grizzleknot bark.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 3061, item2 = 10073, item3 = 19031, item4 = 19033})) then
		e.self:Say("I have crafted your bracer, use it well.");
		e.other:SummonItem(4945);
		e.other:AddEXP(200);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3053, item2 = 19051, item3 = 19042, item4 = 19040})) then
		e.self:Say("I have crafted your helm, use it well.");
		e.other:SummonItem(4947);
		e.other:AddEXP(200);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3058, item2 = 19052, item3 = 19032, item4 = 19035})) then
		e.self:Say("I have crafted your cloak, use it well.");
		e.other:SummonItem(4948);
		e.other:AddEXP(200);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3056, item2 = 19050, item3 = 19036, item4 = 19044})) then
		e.self:Say("I have crafted your breastplate, use it well.");
		e.other:SummonItem(4946);
		e.other:AddEXP(200);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
