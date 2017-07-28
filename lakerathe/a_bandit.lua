function event_combat(e)
	if(e.joined) then
		local cur_target = e.self:GetHateTop();
		if(cur_target) then
			e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
		end
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
