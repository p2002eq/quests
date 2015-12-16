local wolf = nil;

function event_spawn(e)
	eq.pause(2);
	wolf = 0;
end

function event_waypoint_depart(e)
	if (wolf < 8) then
		wolf = wolf + 1;
		eq.pause(273);
	elseif (wolf == 8) then
		wolf = wolf + 1; 
	elseif (wolf > 8) and (wolf < 16) then -- 8 < x > 16
		wolf = wolf + 1;
	elseif (wolf == 16) then
		wolf = wolf + 1;
		eq.ModifyNPCStat('runspeed', 2.5);
	elseif (wolf > 16) and (wolf < 23) then --16 < x < 23
		wolf = wolf + 1
		eq.pause(155);
		eq.ModifyNPCStat('runspeed', 2.5);
		eq.set_timer("10", 755000); --12.5 Minutes	
	end
	
end

function event_timer(e)
	if (e.timer == "10") then
		eq.depop_all(116563);
	end

end
