--[[#Va_Xi_Aten_Ha_Ra
NPC:158440
Zone:vexthal

# Warder control for Va Xi Aten Ha Ra  ]]

function event_spawn(e)

	eq.spawn2(158393,0,0,564.0,9.6,128.75,126.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra
	eq.spawn2(158393,0,0,564.0,-9.6,128.75,126.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra	
	eq.spawn2(158393,0,0,241.1,30.6,128.75,254.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra
	eq.spawn2(158393,0,0,241.1,-30.6,128.75,0.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra
	eq.spawn2(158393,0,0,161.1,-53.3,128.75,0.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra	
	eq.spawn2(158393,0,0,124.1,-53.3,128.75,0.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra	
	eq.spawn2(158393,0,0,161.1,53.3,128.75,254.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra	
	eq.spawn2(158393,0,0,124.1,53.3,128.75,254.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra	
	eq.spawn2(158393,0,0,54.8,30.6,128.75,254.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra
	eq.spawn2(158393,0,0,54.8,-30.6,128.75,0.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra
	eq.spawn2(158393,0,0,-42.7,18,131.2,126.0); 		-- Warder located in hallway behind Va Xi Aten Ha Ra
	eq.spawn2(158393,0,0,-42.7,-18,131.2,126.0); 	-- Warder located in hallway behind Va Xi Aten Ha Ra

	eq.spawn2(158393,0,0,1161.0,0.0,233.1,380.0);	-- Warder located in Aten Ha Ra port in area
	eq.spawn2(158393,0,0,1228.2,-26.59,233.1,0.0);	-- Warder located in room with Aten Ha Ra
	eq.spawn2(158393,0,0,1243.8,-26.59,233.1,0.0);	-- Warder located in room with Aten Ha Ra
	eq.spawn2(158393,0,0,1228.2,26.6,236.1,254.0);	-- Warder located in room with Aten Ha Ra
	eq.spawn2(158393,0,0,1243.8,26.6,236.1,254.0);	-- Warder located in room with Aten Ha Ra

end

function event_death_complete(e)

  eq.depop_all(158393);
  
end

