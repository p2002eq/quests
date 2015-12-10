function event_aggro(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
end

function event_death_complete(e)
	eq.signal(113553,0);
end
