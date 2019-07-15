-- Antonica Scion in Nexus
-- this is a massively simplified version of spires script, which has been altered from its original functionality
-- this is meant as a quality of life improvement for both devs and players who don't have to wait for next port

-- say block
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". I am Horender Tevalian. I was one of the first to travel to Luclin when the secrets of the teleports were unlocked. Once here, the Midst Collective asked that I maintain vigil over the portal back to the Karanas. The teleport system back to Norrath is completely automated. I can activate it for you whenever you wish to [" .. eq.say_link("I wish to travel to Antonica", false, "travel to Antonica") .. "].");
	elseif(e.message:findi("travel to Antonica")) then
		e.self:Say("Good journey to you, " .. e.other:GetName() .. ".");
		e.self:SpellFinished(2708, e.other);
	end
end

-- returns items
function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
