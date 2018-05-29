--Helix_Jeson
--ID:208063
--Zone:povalor 

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("I have no time to talk " .. e.other:GetName() .. ". We are extremely busy at the moment.")
	end
end
