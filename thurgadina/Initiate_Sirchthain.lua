function event_spawn(e)
	eq.set_timer("2", ((math.random(30)*1000) + 10000)); --
	--Random 1-30 in ms * 1000 to get seconds + 10000 = 10-40 seconds
	--Makes them attack every 10-40 seconds
end

function event_timer(e)
	e.self:DoAnim(2);	
	eq.set_timer("2", ((math.random(30)*1000) + 10000)); --why is this twice?
end
