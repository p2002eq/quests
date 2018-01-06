--#a_Koka`Vor_Elder (210465)
--Event Mob for Ston`Ruak,_Ancient_of_Trees (210469)
--postorms

function event_spawn(e)
	eq.set_timer("depop", 30 * 60 * 1000);
end

function event_combat(e)	
	if e.joined then
		eq.stop_timer("depop");
	else 
		eq.set_timer("depop", 15 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.signal(210479,99);  --#Ston_trigger (210479))
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(210479,0);	--#Ston_trigger (210479)
end