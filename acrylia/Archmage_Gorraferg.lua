--#Archmage_Gorraferg in AC

local started = false

function event_spawn(e)
	e.self:Shout("Enough play! Now you die! You will regret disturbing my ritual!");
	eq.set_timer("depop", 10*60*1000);  --set depop timer to 10 min
end


function event_timer(e)
	if e.timer == "depop" then
		eq.signal(154384,1) -- send signal to event trigger that event can be reset
		eq.depop();
	end
end


function event_death_complete(e)
	eq.signal(154104,1) -- send signal to event trigger that event can be reset
end