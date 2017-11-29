--#Loreseeker Maelin
--Planar Progression for access to Plane of Time

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if e.other:HasItem(29165) then		--check for Quintessence of Elements
		if e.message:findi("Hail") then
			e.self:Emote("fidgets about with excitement, 'So here you are, this is quite impressive. I cannot wait to see the results of this impressive machine! I have coordinated with the clockworks here that have not gone mad. We have set the machine to tear a point of time open that should be equal to that based on the cipher and history that we have [" .. eq.say_link("researched") .. "].'");
		elseif e.message:findi("researched") then
			e.self:Say("Based on the findings from the information that you brought back to me I have determined the exact time to open. I believe the machine will work. Please step up and activate the machine! Once you have formed a bond with the Plane of Time you will be able to access the Plane again through the Plane of Tranquility. They have built a portal there, but no one was able to become attuned to that plane, until you that is. Good luck!");
			if qglobals.pop_time_maelin == nil then
				e.other:Message(15,"You have received a character flag!");
				eq.set_global("pop_time_maelin","1",5,"F");
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

