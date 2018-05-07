--a_protector_of_growth (127003)
--zonewide aggro script against non-invis KoS characters
--growthplane

function event_spawn(e)
	AggroCheck(e);
	eq.set_timer("aggro",60 * 1000);	--1 min scan intervals
end

function event_timer(e)
	if e.timer == "aggro" and not e.self:IsEngaged() then
		AggroCheck(e);
	end
end

function AggroCheck(e)
	local client_list = eq.get_entity_list():GetClientList();
	if client_list ~= nil then
		for client in client_list.entries do 
			if not client:IsInvisible(e.self) and not client:GetFeigned() and not client:GetGM() and client:GetModCharacterFactionLevel(43) <= -701   then	--Clerics of Tunare(Primary PoG Faction)
				e.self:AddToHateList(client,1);
			end
		end
	end
end