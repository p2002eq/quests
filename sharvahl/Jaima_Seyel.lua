function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello Citizen. I am in need of an apprentice.  If you feel that you are capable of assisting me. please show me your Dar Khura Apprentice Cloak and I'll explain the task to you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5544})) then
		e.self:Say("Very well done --name.  I do have use for you if you are able.  Take this bag and fill it with Sonic Wolf Paws and bring it back to me.  I can help you once that has occurred.");
		e.other:SummonItem(17116);
		e.other:QuestReward(e.self,0,0,0,0,5544);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 6264})) then
		e.self:Say("Well done!  Take this note to Amat and he can provide further instructions.  Also take this strainer as you will need it to make the sealant.");
		e.other:SummonItem(6265);
		e.other:QuestReward(e.self,0,0,0,0,6140);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
