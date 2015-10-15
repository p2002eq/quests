function event_signal(e)
	if(e.signal == 1) then --Night
		eq.move_to(92,703,39,131,1);
	elseif(e.signal == 2) then --Day
		eq.move_to(20,534,68,0,1);
	end
end
