--Tarkil_Adan (200229)
--Flag Mob for Carprin/HP cycle

local counter = 0;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000); -- 10 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then	
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and counter < 36 and qglobals.pop_cod_preflag == nil then
		e.self:Emote("lets out a groan and then whimpers saying, 'Yes great ones yesss I was king once I wasss. ' The creature then mutters under his breath and passes you a small glowing bone fragment etched in runes. Then speaks again saying, 'The tortured ones oh the tortured ones, you must go to the depths of Lxanvom and free them. Go to the bone throne at the ruins entrance there you will find access to the depths.' He then goes back to whimpering and rocking back and forth.");
		eq.set_global("pop_cod_preflag", "1", 5, "F");
		e.other:Message(4,"You've received a character flag!");
		counter = counter + 1;
	end
end
