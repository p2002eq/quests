function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
		eq.move_to(-639,-85,-24,16,true);
	elseif(e.signal == 2) then
		eq.start(35);
	end
end
