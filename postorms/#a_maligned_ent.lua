--#a_maligned_ent (210476)
--encounter adds for #Neffiken,_Lord_of_Kelek`Vor (210470)
--postorms

function event_combat(e)	--will alaready be aggro on engage
	if e.joined then
		eq.set_timer("depop", 30 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end
