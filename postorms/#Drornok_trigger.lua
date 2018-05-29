--#Drornok_trigger (210478)
--Trigger for #Drornok_Tok_Vo`Lok (210480)
--postorms

function event_signal(e)
	if not trash_check() then
		eq.unique_spawn(210480,0,0,-42,-197,-630,0); --#Drornok_Tok_Vo`Lok (210480
		eq.depop_with_timer();
	end
end

function trash_check()	--iterate through related NPC ids
	local mob_table = {210084,210046,210040,210047};	--a_vacillating_loktole (210084, a_hurricane_loktole (210046), a_typhoon_amphan (210040), a_tempest_toad (210047)

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end
