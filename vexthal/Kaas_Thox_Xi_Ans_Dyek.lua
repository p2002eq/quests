--[[Kaas_Thox_Xi_Ans_Dyek (Blob1)
NPC:158444
Zone:vexthal

Warder control for first raid target on 1st floor of vexthal  ]]

function event_spawn(e)
	eq.spawn2(158418,0,0,626.0,256.0,6.25,380); 	-- Akhevan Warder at North Wing
	eq.spawn2(158418,0,0,626.0,-256.0,6.25,380); 	-- Akhevan Warder at South Wing
	eq.spawn2(158418,0,0,1489.6,-17.4,115.6,508); -- Warder located in Thall Va Kelun port in area on 2nd floor
	eq.spawn2(158418,0,0,1489.3,17.4,115.6,256);	-- Warder located in Thall Va Kelun port in area on 2nd floor
	eq.spawn2(158418,0,0,941.0,0,126.1,380);		-- Warder located in Va Xi Aten Ha Ra port in area on 2nd floor 	
	eq.spawn2(158418,0,0,1106.7,0.3,236.1,126);	-- Warder located in Aten Ha Ra port in area
	eq.spawn2(158418,0,0,1277.4,0.2,236.1,380);	-- Warder located in room with Aten Ha Ra
	eq.spawn2(158418,0,0,1366.3,0.2,236.1,380);	-- Warder located in room with Aten Ha Ra
end

function event_death_complete(e) 
	eq.depop_all(158418);
end

