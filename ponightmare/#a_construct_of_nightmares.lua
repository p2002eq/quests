function event_death_complete(e)
	if e.self:GetY() >= 3700 and e.self:GetY() <= 4500 then
		eq.signal(204055,99);	--signal Thelin to allow hand-in (Maze #1)
	elseif e.self:GetY() >= 4600 and e.self:GetY() <= 5500 then
		eq.signal(204056,99);	--signal Thelin to allow hand-in (Maze #2)
	elseif e.self:GetY() >= 5600 and e.self:GetY() <= 6500 then
		eq.signal(204057,99);	--signal Thelin to allow hand-in (Maze #3)
	end
end

