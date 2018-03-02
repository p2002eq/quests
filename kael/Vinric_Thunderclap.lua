function event_combat(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
end

function event_death_complete(e)
	eq.spawn2(113528,28,0,1130.3,-933.2,-125.6,126.6);
end
