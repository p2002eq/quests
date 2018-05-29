--a_storm_battered_traveler

function event_spawn(e)
	if e.self:GetSpawnPointID() == 346375 or e.self:GetSpawnPointID() == 346413 then	--set stats for spawnpoint where mobs are laying down
		e.self:SetSpecialAbility(35, 1);	--immune to player damage
		e.self:SetSpecialAbility(24, 1);	--will not aggro
		e.self:SetSpecialAbility(25, 1);	--immune to aggro
	end
end
function event_say(e)
	if e.message:findi("hail") and (e.self:GetSpawnPointID() == 346375 or e.self:GetSpawnPointID() == 346413)  then	--lying spawnpoint
		e.other:Message(7,"Whoever this is, they seem to be asleep... or worse. It might be best to leave them alone for the time being.");
	elseif e.message:findi("hail") then
		e.self:Say("The Storms of the forest hide a secret. When the Storms have gone from the forest, the secret shall come forth from the shadows to make itself known, or so they say.");
	end
end
