function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! I suggest you stay within the walls of Cabilis. This is no place for you. The Field of Bone is far too close.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("Oh, no! My good times have come to an end. Hand me the note and I shall sign it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18249})) then --Legion Order (9 signed)
		e.self:Say("Ha ha! Look at all the names. Ozlot and Frogzin. What lushes. Here you are. I can't imagine there being any others to sign. This is the entire Cabilis brew brigade. Alas... Disbanded forever.");
		e.other:Faction(193,5); --Legion of Cabilis
		e.other:Faction(30,5); --Cabilis Residents
		e.other:Faction(282,5); --Scaled Mystics
		e.other:Faction(62,5); --Crusaders of Greenmist
		e.other:Faction(317,5); --Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,18250,200); --Legion Order (all signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
