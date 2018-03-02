function event_combat(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
end

function event_death_complete(e)
	eq.spawn2(113471,29,0,1130.3,-749.6,-125.6,126.6);
end
