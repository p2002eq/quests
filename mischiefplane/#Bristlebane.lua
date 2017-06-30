function event_signal(e)
	if (e.signal == 1) then
		e.self:Shout("Bah!  Where be the Cazic Thule Puppet!  Ridiculously funny!");
	elseif (e.signal == 2) then
		e.self:Shout("Well, there is nothing to see here!  Go home everyone!");
	end
	
end