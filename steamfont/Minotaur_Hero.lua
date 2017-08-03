function event_combat(e)
	if(e.joined) then
		e.self:Say("<Snort!!>.. For Meldrath!!");
	end
end

function event_death_complete(e)
	e.self:Say("I die soon! Meldrath, help me!");
end
