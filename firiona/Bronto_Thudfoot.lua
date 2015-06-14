function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("What's a kid like you doing in a dangerous place like this?  Shouldn't you be at home having bread. cakes and milk?");
		e.self:DoAnim(69);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("puts his head over your head as if measuring you.  'Heh!!  Going to have to grow up before the General lets him out to play in Kunark!'");
		e.self:DoAnim(64);
		eq.signal(84130,1);
	elseif(e.signal == 2) then
		e.self:Say("No way, Lenka!  This place is too dangerous for this kid.  Why don't you just stay here and drink it up with us?  The Samson couldn't even brew bog juice right, but every once in a while a bashed-up explorer comes in carrying [Cabby Pale Ale].");
		e.self:DoAnim(59);
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
