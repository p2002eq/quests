--[[#Thall_Va_Kelun
NPC:158439
Zone:vexthal

Warder control for 1st raid target(s) on 2nd floor of vexthal ]]

function event_spawn(e)
	eq.spawn2(158405,0,0,1736.1,-250.1,115.6,0);  	--Warder located on South Corridor (#1)
	eq.spawn2(158405,0,0,1736.1,-372,120.3,0);  	--Warder located on South Corridor (#2)	
	eq.spawn2(158405,0,0,1736.1,250.1,115.6,254);	--Warder located on North Corridor (#1)
	eq.spawn2(158405,0,0,1736.1,372,120.3,254);	--Warder located on North Corridor (#2)	
	eq.spawn2(158405,0,0,880.0,-14.86,126.1,126);  --Warder located in Va Xi Aten Ha Ra port in area on 2nd floor 	
	eq.spawn2(158405,0,0,1133.7,19.5,236.1,254);	--Warder located in Aten Ha Ra port in area
	eq.spawn2(158405,0,0,1314.8,-63.0,233.1,380);	--Warder located in room with Aten Ha Ra
	eq.spawn2(158405,0,0,1314.8,63.0,233.1,380);	--Warder located in room with Aten Ha Ra
	
end

function event_death_complete(e)
  eq.depop_all(158405);
end

