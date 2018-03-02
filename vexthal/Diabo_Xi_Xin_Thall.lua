--[[#Diabo_Xi_Xin_Thall
NPC:158443
Zone:vexthal

Warder control for final raid target on 1st floor of vexthal ]]

function event_spawn(e)
	
	eq.spawn2(158409,0,0,1596.9,23.6,63.1,254);	-- Warder located in port up to 2nd floor
	eq.spawn2(158409,0,0,1596.9,-23.6,63.1,0);		-- Warder located in port up to 2nd floor 
	eq.spawn2(158409,0,0,1557.9,23.6,63.1,254);	-- Warder located in port up to 2nd floor
	eq.spawn2(158409,0,0,1557.9,-23.6,63.1,0);		-- Warder located in port up to 2nd floor
	eq.spawn2(158409,0,0,1508.4,2.0,115.6,384);	-- Warder located at TVK 2nd floor port in room
	eq.spawn2(158409,0,0,880.0,14.86,126.1,126); 	-- Warder located in Va Xi Aten Ha Ra port in area on 2nd floor 	
	eq.spawn2(158409,0,0,1133.7,-19.5,236.1,0.0);	-- Warder located in Aten Ha Ra port in area
	eq.spawn2(158409,0,0,1380.0,-38.0,233.1,380);	-- Warder located in room with Aten Ha Ra
	eq.spawn2(158409,0,0,1380.0,38.0,233.1,380);	-- Warder located in room with Aten Ha Ra
end

function event_death_complete(e)
  eq.depop_all(158409);
end

