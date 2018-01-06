--a_forgotten_traveler

function event_spawn(e)
	if e.self:GetSpawnPointID() == 346367 then	--set stats for spawnpoint where mobs are laying down
		e.self:SetSpecialAbility(35, 1);	--immune to player damage
		e.self:SetSpecialAbility(24, 1);	--will not aggro
		e.self:SetSpecialAbility(25, 1);	--immune to aggro
	end
end
function event_say(e)
	if e.message:findi("hail") and e.self:GetSpawnPointID() == 346367 then	--lying spawnpoint
		e.other:Message(7,"Whoever this is, they seem to be asleep... or worse. It might be best to leave them alone for the time being.");
	elseif e.message:findi("hail") and e.self:GetSpawnPointID() == 346687 then	--guarding spawn out front
		e.self:Say("I'm on lookout for any Storms, best leave me to my work.");
	elseif e.message:findi("hail") then
		e.self:Say("Someone was saying something about there being a new visitor to the caves, but I'm not sure who they were talking about.");
	end
end