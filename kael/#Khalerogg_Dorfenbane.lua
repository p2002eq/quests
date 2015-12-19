function event_combat(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
end
function event_death_complete(e)
	eq.spawn2(113630, 0, 0, 1180, -839, -128, 65);
end
