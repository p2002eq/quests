--a_Koka`Vor_bark_spirit (210463)
--Event Mob for Ston`Ruak,_Ancient_of_Trees (210469)
--postorms

function event_spawn(e)
	eq.set_timer("depop", 3 * 60 * 1000);	--30 min to engage or will depop
end

function event_combat(e)	
	if e.joined then
		eq.stop_timer("depop");
	else 
		eq.set_timer("depop", 3 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end
