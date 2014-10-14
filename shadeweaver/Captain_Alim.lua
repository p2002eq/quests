function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Have you come for training young one?  The way of the Beastlord teaches many things about the forces of nature.  The [forces] in the thicket are very interesting.");
	elseif(e.message:findi("forces")) then
		e.self:Say("Yes, the force that compels a creature to adjust to their surroundings in particular.  The Saruek have seem to adapted to their environment very well.  I am studying the effects of their claws.   It seems the different [variety] of Saruek have special enhancements.");
	elseif(e.message:findi("variety")) then
		e.self:Say("Well, for example the Firefall Saruek can attack with claws that burn the flesh, the Deathmaw attack with poisonous claws. the shredder Saruek are especially skilled in fending off the Tegi that threaten them, and lastly there is a more uncommon Claw Beast that is very strong but does not appear that often.  I believe I could take their claws and affix them to a weapon to [enhance] it.");
	elseif(e.message:findi("enhance")) then
		e.self:Say("If you would like to test this theory go hunt these Saurek.  Bring me three claws each for Deathmaw, Firefall, and Shredder.  Due to the reported size of the Claw Beast I only need his talons.  Along with these claws bring me a wooden practice flail to fasten the claws to.  Go now I have many trainees waiting to be taught.");
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
