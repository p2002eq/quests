function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Time to die " .. e.other:GetName() .. ".");
	end
end
