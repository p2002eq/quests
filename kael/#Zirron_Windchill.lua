function event_combat(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
end

function event_death_complete(e)
	eq.spawn2(113624,0,0,1180,-839,-125.50, 60);
end
