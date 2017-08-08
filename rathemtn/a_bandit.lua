function event_combat(e)
	if(e.joined) then
		e.self:Say("Time to die " .. e.other:GetName() .. ".");
	end
end
