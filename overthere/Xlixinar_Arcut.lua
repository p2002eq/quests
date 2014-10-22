function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Begone unless you seek the armor of the [trooper]");
	elseif(e.message:findi("trooper")) then
		e.self:Say("I can provide [breastplate], [pauldrons], [helm], or [vambraces]");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("The monk is the master of focus, the shaman of sacrifice and the shadowknight of righteousness. Lastly, our brothers of the dark know confidence. It is then our duty to know perseverance more than any other. When others fall from spear and sword, we must stand. When others are washed away by fire and ice, we must stand. When others are frustrated and confused, we must continue on. There is a warrior in the swamp near the city. He is an exile, like my brother and I. He knows more about than I.");
		e.other:SummonItem(14789);
	elseif(e.message:findi("helm")) then
		e.self:Say("You must first learn focus before being awarded the legionnaire scale helm. The Swifttails are the masters of focus and as such you will learn from the Grand Master of the Court. It has been so long, I do not know who is Grand Master now. Whoever it is, give him this note and follow his instruction. Once you have learned, return to us and the helm will be yours.");
		e.other:SummonItem(14788);
	elseif(e.message:findi("vambraces")) then
		e.self:Say("Our arms carry more than the weapons of war and the hands that make use of them. We sacrifice the strength in our arms to carry our duties and obligations. Unless we can sacrifice our own bodies and abilities to carry these ideals, we will never be fit to protect the Chosen. Take this note to the master of the mystics in Cabilis, he will teach you a lesson in sacrifice.");
		e.other:SummonItem(14790);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 14783, item2 = 3053})) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4976,1000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14786, item2 = 3060})) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4979,1000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14783, item2 = 3056})) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,4977,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
