local priest = nil;

function event_spawn(e)
	eq.pause(2);
	priest = 0;
end

function event_waypoint_depart(e)
	if (priest < 8) then
		priest = priest + 1;
		eq.pause(273);
	elseif (priest == 8) then
		priest = priest + 1; 
	elseif (priest > 8) and (priest < 16) then -- 8 < x > 16
		priest = priest + 1;
	elseif (priest == 16) then
		priest = priest + 1;
		eq.ModifyNPCStat('runspeed', 2.5);
	elseif (priest > 16) and (priest < 23) then --16 < x < 23
		priest = priest + 1
		eq.pause(155);
		eq.ModifyNPCStat('runspeed', 2.5);
		eq.set_timer("8", 755000); --12.5 Minutes	
	end
	
end

function event_timer(e)
	if (e.timer == "7") then
		eq.depop_all(116541);
	end

end
