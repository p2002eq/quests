--LUA for a_temple_guardian  (Bodyguards of Derakor the Vindicator)
--zone: Kael

local vindi = eq.get_entity_list():GetNPCByNPCTypeID(113118):GetID();  -- sets guards to follow Vindi

function event_signal(e)
	if (e.signal == 1) then
		eq.follow(vindi,40);  --sets guards to follow vindi at his current position upon being engaged
		eq.set_timer("follow",5*60*1000);  --guards will shadow Vindi for 5 minutes
	end
end

function event_timer(e)
	if (e.timer == "follow") then
		eq.stop_timer("follow");
		eq.stop_follow();	  -- guards return to spawnpoint in temple
	end
end



