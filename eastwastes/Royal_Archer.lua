local archer = nil;

function event_spawn(e)
	eq.pause(2);
	archer = 0;
end

function event_waypoint_depart(e)
	if (archer < 8) then
		archer = archer + 1;
		eq.pause(273);
	elseif (archer == 8) then
		archer = archer + 1; 
	elseif (archer > 8) and (archer < 16) then -- 8 < x > 16
		archer = archer + 1;
	elseif (archer == 16) then
		archer = archer + 1;
		eq.ModifyNPCStat('runspeed', 2.5);
	elseif (archer > 16) and (archer < 23) then --16 < x < 23
		archer = archer + 1
		eq.pause(155);
		eq.ModifyNPCStat('runspeed', 2.5);
		eq.set_timer("9", 755000); --12.5 Minutes	
	end
	
end

function event_timer(e)
	if (e.timer == "9") then
		eq.depop_all(116555);
	end

end
