-- Quest for Vrynn in Lakerathe - Shaman Totemic Armor (low 30's armor)
-- kiladiveus - completed subevents for this quest NPC. I created the ending statement since i can't find any. Same as exp.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, spiritwalker. I am called Vrynn. If you have banded armor, my wife Kyralynn and I can form it into a new shaman armor using this totem and some reagents for the ritual. I make armor from banded [boots], [gauntlets], [sleeves], and [leggings].");
	elseif(e.message:findi("boots")) then
		e.self:Say("The boots require banded boots, 1 dufrenite, an orc chief's tongue from Lesser Faydark, and terror spines from a tentacle terror in Najena.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("The gauntlets require banded gauntlets, 1 crushed dufrenite, a mammoth rib bone, and a griffenne downfeather.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("The sleeves require banded sleeves, 1 ground dufrenite, ghoul carrion from Estate of Unrest, and charger hoof chips.");
	elseif(e.message:findi("leggings")) then
		e.self:Say("The leggings require banded leggings, 1 powdered dufrenite, a Permafrost snowball from a goblin wizard, and bone barbs from Estate of Unrest.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 3064, item2 = 10073, item3 = 19039, item4 = 19041})) then
		e.self:Say("I have crafted your boots, use them well.");
		e.other:SummonItem(4941);
		e.other:AddEXP(200);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 3062, item2 = 19050, item3 = 19043, item4 = 19046})) then
		e.self:Say("I have crafted your gauntlets, use them well.");
		e.other:SummonItem(4942);
		e.other:AddEXP(200);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 3060, item2 = 19051, item3 = 19038, item4 = 19045})) then
		e.self:Say("I have crafted your sleeves, use it well.");
		e.other:SummonItem(4943);
		e.other:AddEXP(200);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 3063, item2 = 19052, item3 = 19034, item4 = 19037})) then
		e.self:Say("I have crafted your leggings, use them well.");
		e.other:SummonItem(4944);
		e.other:AddEXP(200);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
