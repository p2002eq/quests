-- Odus Scion in Nexus
-- this is a massively simplified version of spires script, which has been altered from its original functionality
-- this is meant as a quality of life improvement for both devs and players who don't have to wait for next port

-- say block
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". I am here to assist and watch over those who wish to return to the continent of Odus. Due to the limited space I share this area with the portal to Velious. The teleport system back to Norrath is completely automated. I can activate it for you whenever you wish to " .. eq.say_link("I wish to travel to Odus", false, "travel to Odus") .. ".");
	elseif(e.message:findi("travel to Odus")) then
		e.self:Say("Good journey to you, " .. e.other:GetName() .. ".");
		e.self:SpellFinished(2707, e.other);
	end
end

-- returns items
function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
