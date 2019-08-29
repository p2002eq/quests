-- Faydwer Scion in Nexus
-- this is a massively simplified version of spires script, which has been altered from its original functionality
-- this is meant as a quality of life improvement for both devs and players who don't have to wait for next port

-- say block
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". I am Jucian Featherhigh, the guardian of this teleport. It will take you back to my home in the Faydark. The teleport system back to Norrath is completely automated. I can activate it for you whenever you wish to [" .. eq.say_link("I wish to travel to Faydwer", false, "travel to Faydwer") .. "].");
	elseif(e.message:findi("travel to Faydwer")) then
		e.self:Say("Good journey to you, " .. e.other:GetName() .. ".");
		e.self:SpellFinished(2706, e.other);
	end
end

-- returns items
function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
