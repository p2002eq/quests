--An_Unimaginable_Horror (207031)
--Mouth Event
--potorment

function event_death_complete(e)
	--banish nearby players
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 200 then
				client:CastToMob():SpellFinished(1133, client:CastToMob());	--Dimensional Return
			end
		end
	end
	
	eq.signal(207028,0); --signal Baraguj to depop and spawn real Baragul
end