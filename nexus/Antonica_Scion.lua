function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". I am Horender Tevalian. I was one of the first to travel to Luclin when the secrets of the teleports were unlocked. Once here, the Midst Collective asked that I maintain vigil over the portal back to the Karanas. The [teleport system] back to Norrath is completely automated. I have no direct control over when the portal will turn on, although I can say that the system works on a schedule of approximately ten minutes.");
	elseif(e.message:findi("teleport system")) then
		e.self:Say("The teleport system is pretty simple from your perspective. Simply listen for the voice saying that the portals will become active soon. When the time nears, you should stand on the elevated pad you see next to me. Shortly after you see the message that the teleporters are active, you will be transported to your destination..");
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
