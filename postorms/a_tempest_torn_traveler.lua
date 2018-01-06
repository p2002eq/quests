--a_tempest_torn_traveler

function event_say(e)
	if e.message:findi("hail") and (e.self:GetSpawnPointID() == 346688 or e.self:GetSpawnPointID() == 346689)  then		--guarding spawn outside caves
		e.self:Say("I'm on lookout for any Storms, best leave me to my work.");
	elseif e.message:findi("hail") then
		e.self:Say("The dreams, they come and go, but they're always the same. The eternal storm amidst the Storms; what could it mean? If only I could find out, I might be able to rest peacefully at night.");
	end
end

