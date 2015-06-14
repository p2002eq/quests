function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings hearty adventurer. Searching for the components necessary for fine shaman spells are we? I have come to Kunark in search of [rare alchemy components], but I have found the dangers of Kunark are far too great for me.");
		e.self:DoAnim(69);
	elseif(e.message:findi("rare alchemy components") or e.message:findi("four rare components")) then
		e.self:Say("I have heard word of four rare components -  the clay of Ghiosk, crushed dread diamonds and powder of Yun.  Most rare are chips from the bones of one who has touched the Bath of Obulus.");
		e.self:DoAnim(27);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12942, item2 = 12945, item3 = 12944, item4 = 12943})) then
		e.self:Say("What's this? This is amazing - you collected them all! To think, the power that these items hold if properly used. Never mind that now, here, take the scroll. You've certainly earned it.");
		e.other:QuestReward(e.self,0,0,0,0,12941,45000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Author: BWStripes
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
