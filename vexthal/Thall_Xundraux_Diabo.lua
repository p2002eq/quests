--[[#Thall_Xundraux_Diabo
NPC:158442
Zone:vexthal

# Warder control for 2nd raid target(s) on 2nd floor of vexthal ]]

function event_spawn(e) 
	eq.spawn2(158399,0,0,839.61,0.3,126.75,63.0);		-- Warder located in room with Va Xi Aten Ha Ra
	eq.spawn2(158399,0,0,1184.8,26.6,236.1,127.0);		-- Warder located in room with Aten Ha Ra
	eq.spawn2(158399,0,0,1184.8,-26.6,236.1,0.0);		-- Warder located in room with Aten Ha Ra 
end

function event_death_complete(e)
  eq.depop_all(158399);
end
