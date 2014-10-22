-- Part of SK Epic 1.0
function event_say(e)
	if(e.other:GetFaction(342) > 81) then--True Spirit
		e.self:Say("Alas, I cannot be the one to carry the sword back to my people as proof in fear they will kill me to possess it for their own. I think a simple trade is in order. Perhaps you have a symbol or token of Lhanrc's that I could take back to the others to ease their worries?");
	else
		e.self:Emote("seems to ignore you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(342) > 81) then--True Spirit
		if(item_lib.check_turn_in(e.trade, {item1 = 14384})) then --Lhranc's Token
			e.self:Say("Very good, I will go deliver this right away.");
			e.other:QuestReward(e.self,0,0,0,0,14383); --Innoruuk's Curse
			eq.depop();
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
