--#Chronographer_Muon
--Planar Progression for access to Plane of Time

function event_say(e)
	--disable access to PoTime until release
	if e.other:HasItem(29165) then		--check for Quintessence of Elements
		if e.message:findi("Hail") then
			e.self:Say("Acquisition of power completed. Would you like to be [" .. eq.say_link("I would like to be transported", false, "transported") .. "] to the time-projection chamber?")
		elseif e.message:findi("transported") then
			e.self:Say("Compliance.");
			e.other:MovePC(206, 266,-857,-1853,130);
		end
	elseif e.message:findi("Hail") then
		e.self:Say("Greeting acknowledged.  I have no use for you at this time.  Good bye.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
