function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. friend!  If armor is what you seek. let the house of Gaxx provide you with the finest.  Our metalwork is second to none.  Every now and again we may even create [rare armor] for the general public to purchase.");
	elseif(e.message:findi("what rare armor?")) then
		e.self:Say("I have found many exotic materials in Kunark with which I can create rare armor.  I currently am working on the [Guard of Ik] and the [Hate Tail Guard] shields.  I have no armor as of yet. but I am experimenting with new designs.");
	elseif(e.message:findi("what is the Guard of Ik")) then
		e.self:Say("The Guards of Ik are made from shields found in the jungles.  I would be selling them if it were not for the unfortunate fact that the shields are spectral and vanish overnight.  Another bit of bad news is that the formula I was working on to stabilize the essence of the metal was stolen by local pirates.  I need two more shields and my formula.  Bring these to me and I shall not charge you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
