--GM EVent

function event_spawn(e)
	if (math.random(100) < 25) then
		e.self:AddItem(13085, math.random(3));
	end
	
	if (math.random(100) < 11) then
		e.self:AddItem(eq.ChooseRandom(19999,20384,15969,15968,15967,8183,8186,8181,8184,29753,8176,9661,30807,9751,8180,29751,13460,13459,13470,13469,15963,8196,8193,8188,19177,8190,8191,8192,8195), math.random(10));
	end
end
