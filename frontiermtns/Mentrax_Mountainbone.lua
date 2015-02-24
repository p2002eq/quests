function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What be it you want! Go away before I eat you for dinner!");
	elseif(e.message:findi("wenden sent me")) then
		e.self:Say("Did he? Perhaps you would like to trade for some Rejesiam ore? Bring me the monocle from the patriarch that wanders around the Dreadlands. I've always wanted one of those."); -- made up dialogue - will replace with correct dialogue once found from live servers
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20678})) then
		e.self:Say("Eh, you actually found one! Thank you, " .. e.other:GetName() .. ". Here is a block of ore for you. Just don't let the other giants know.");
		e.other:QuestReward(e.self,0,0,0,0,20666,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
