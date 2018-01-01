--Planar Projection

local counter = 0;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000); --10 mins
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and counter < 72 and qglobals.pop_cod_bertox == nil then
		if tonumber(qglobals.pop_pod_elder_fuirstel) == 1 or tonumber(qglobals.pop_cod_preflag) == 1 then
			e.other:Message(7,"Milyk Fuirstel's thoughts enter into your own. 'Bertoxxulous is slain, for this my brother and I are forever in your debt. Please, when you have the opportunity come visit me in the Plane of Tranquility. I would like to thank you face to face.'");
		else
			e.other:Message(7,"The Planar Projection seems to flicker in and out of existence.  It seems joyous that Bertoxxulous has been slain.");	--indicates missing pre-flags
		end	
		eq.set_global("pop_cod_bertox", "1", 5, "F");
		e.other:Message(4,"You've received a character flag!");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

