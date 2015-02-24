-- Part of quest for Rod of Insidious Glamour

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. I am Cynthia.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	-- A Glamour Stone
	if(item_lib.check_turn_in(e.trade, {item1 = 10085, gold = 50})) then
		e.self:Say("I've done what I can to enchant your stone, but you will need to find Tarn Visilin in Highpass Keep to finish the enchantments.  Don't forget to pay him the same fee you gave me, or he may decide to keep the stone for himself!"); -- Made this text up
		e.other:QuestReward(e.self,0,0,0,0,10086);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------