function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. friend!  If armor is what you seek. let the house of Gaxx provide you with the finest.  Our metalwork is second to none.  Every now and again we may even create [rare armor] for the general public to purchase.");
		e.self:DoAnim(29);
	elseif(e.message:findi("rare armor?")) then
		e.self:Say("I have found many exotic materials in Kunark with which I can create rare armor.  I currently am working on the [Guard of Ik] and the [Hate Tail Guard] shields.  I have no armor as of yet. but I am experimenting with new designs.");
	elseif(e.message:findi("guard of ik")) then
		e.self:Say("The Guards of Ik are made from shields found in the jungles.  I would be selling them if it were not for the unfortunate fact that the shields are spectral and vanish overnight.  Another bit of bad news is that the formula I was working on to stabilize the essence of the metal was stolen by local pirates.  I need two more shields and my formula.  Bring these to me and I shall not charge you.");
	elseif(e.message:findi("hate tail guard")) then
		e.self:Say("I can create teh Hate Tail Guard using both metal and scorpion carapaces. I have the metal. I will make you one for the price of 100 gold coins - I accept only gold. I will also need two flawless carapaces from giant hate tail scorpions.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12883, item2 = 12883, item3 = 12971})) then
		e.other:QuestReward(e.self,0,0,0,0,12972,1500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
