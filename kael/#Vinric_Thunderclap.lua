--there was no information the perl need to know what this mob does
function event_combat(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
end

function event_spawn(e)
	eq.set_timer("depop", 30*60*1000); --30 min despawn
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end