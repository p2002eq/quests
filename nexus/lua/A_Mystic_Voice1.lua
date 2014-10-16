function event_signal(e)
	if(e.signal == 20) then
		e.self:Say("In approximately ten minutes the portals will become active and will transport you back to Odus, Antonica, Faydwer, and Kunark.  In five minutes the portal to Velious will become active.");
	end
	if(e.signal == 21) then
		e.self:Say("The portal to Velious will become active in three minutes.  Please begin gathering in the portal area.");
	end
	if(e.signal == 22) then
		e.self:Say("One minute till teleportation to Velious.  Please be prepared to step onto the teleport pad.");
	end
	if(e.signal == 23) then
		e.self:Say("The portal to Velious is now active.  Please stand on the pad and you will be teleported shortly.");
		e.self:Say("The portals to Odus, Antonica, Faydwer, and Kunark will become active in five minutes. Please begin gathering in the portal areas.");
	end
	if(e.signal == 24) then
		e.self:Say("As a reminder, the portals to Odus, Antonica, Faydwer, and Kunark will become active in three minutes.");
	end
	if(e.signal == 25) then
		e.self:Say("One minute till teleportation to Odus, Antonica, Faydwer, and Kunark. Please be prepared to step onto the teleport pad.");
	end
	if(e.signal == 26) then
		e.self:Say("The portals to Odus, Antonica, Faydwer, and Kunark are now active. Please stand on the pad and you will be teleported shortly. Come back soon.");
		e.self:Say("In approximately ten minutes the portals will become active and will transport you back to Odus, Antonica, Faydwer, and Kunark.  In five minutes the portal to Velious will become active.");
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
