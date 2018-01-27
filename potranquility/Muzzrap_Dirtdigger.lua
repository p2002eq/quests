--Muzzrap_Dirtdigger (203362)
--potranquility

--Note:  This quest NPC offers quest to convert PoEB Crystal to group flags.  This quest isn't implemented due to outside P2002 timeline (http://everquest.allakhazam.com/db/quest.html?quest=7987)

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hi there " .. e.other:GetName() .. ", what brings you to these parts? You wouldn't be attempting to enter the Plane of Earth I hope, it is quite dangerous in there. I have heard of mortals attempting to seek council with the Rathe and I would say this is a very bad idea.");
	end
end



