function event_signal(e)
	if(e.signal == 1) then
		eq.start(21);
	elseif(e.signal == 2) then
		eq.stop();
	end
end