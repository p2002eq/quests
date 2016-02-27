local oracleSpawns = math.random(2, 4);

function event_encounter_load(e)
	eq.spawn2(116596, 0, 0, -4446, -3350, 150, 74); --Poxbreath
--always spawn at least 2	
	eq.spawn2(116587, 0, 0, -4423, -3332, 150, 131);
	eq.spawn2(116587, 0, 0, -4423, -3332, 150, 131);
	
	if (oracleSpawns == 3) then	
		eq.spawn2(116587, 0, 0, -4391, -3353, 150, 191);
	elseif (oracleSpawns == 4) then
		eq.spawn2(116587, 0, 0, -4391, -3353, 150, 191);
		eq.spawn2(116587, 0, 0, -4443, -3371, 150, 36);
	end
end


