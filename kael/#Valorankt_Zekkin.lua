function event_combat(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
end
function event_death_complete(e)
	eq.spawn2(113621, 42, 0, 1125, -839.0, -120.80, 70);
end
