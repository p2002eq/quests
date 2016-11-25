--GM EVent

function event_spawn(e)
	if (math.random(100) < 50) then
		e.self:AddItem(13085, math.random(6));
	end
	
	if (math.random(100) < 75) then
		e.self:AddItem(eq.ChooseRandom(20096,20093,20092,20094,20095,13493,13494,30626), math.random(10));
	end
end

