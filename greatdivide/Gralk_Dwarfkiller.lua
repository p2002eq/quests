function event_signal(e)
	-- signal from Broodmother to walk out to front of fort to meet her.
	if(e.signal == 1) then
		e.self:Say("The broodmother approaches. Come Fergul, we must defend the fort!");
		eq.start(138);
	-- signal to depop from Fergul Frostsky once he either reaches end of path or dies
	elseif (e.signal == 2) then
		eq.depop_with_timer();
	end
end
