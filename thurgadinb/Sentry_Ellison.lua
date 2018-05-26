--Sentry_Ellison (129001)
--thurgadinb

function event_spawn(e)
	eq.set_timer("emote", math.random(3,5) * 60 * 1000);
end

function event_timer(e)
	if e.timer == "emote" then
		eq.set_timer("emote", math.random(3,5) * 60 * 1000);
		e.self:Emote("yawns and says, 'Brell's beard, am I tired. I'm sure the Seneschal wouldn't mind if I just took a short rest.'");
	end
end