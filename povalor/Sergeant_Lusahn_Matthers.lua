--Sergeant_Lusahn_Matthers 
--ID:208060 
--Zone:povalor

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I have a little time to chat, we are not due in the [" .. eq.say_link("field") .. "] for a while. What may I help you with?");
	elseif e.message:findi("field") then
		e.self:Say("The Glassy Wastelands. We work hard to keep the [" .. eq.say_link("plight") .. "] back from the rest of the Forest, but I fear that is a losing battle.");
	elseif e.message:findi("plight") then
		e.self:Say("I am afraid that I am not at liberty to go into depth, even with the little that we know. What I can tell you is that the Wasteland is dangerous; the glass manages to hide terrors that few men outside these walls could bear to speak of, much less see. If you choose to journey know that we will offer you little protection.");
	end
end

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end