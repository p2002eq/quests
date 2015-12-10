local paladin = nil;

function event_spawn(e)
	eq.pause(2);
	paladin = 0;
end

function event_waypoint_depart(e)
	if (paladin < 8) then
		paladin = paladin + 1;
		eq.pause(273);
	elseif (paladin == 8) then
		paladin = paladin + 1; 
	elseif (paladin > 8) and (paladin < 16) then -- 8 < x > 16
		paladin = paladin + 1;
	elseif (paladin == 16) then
		paladin = paladin + 1;
		eq.ModifyNPCStat('runspeed', 2.5);
	elseif (paladin > 16) and (paladin < 23) then --16 < x < 23
		paladin = paladin + 1
		eq.pause(155);
		eq.ModifyNPCStat('runspeed', 2.5);
		eq.set_timer("7", 755000); --12.5 Minutes	
	end
	
end

function event_timer(e)
	if (e.timer == "7") then
		eq.depop_all(116549);
	end

end
