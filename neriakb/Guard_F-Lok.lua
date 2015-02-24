function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
		eq.move_to(-630,-71,-24,162,true);
	elseif(e.signal == 2) then
		eq.start(36);
	end
end
