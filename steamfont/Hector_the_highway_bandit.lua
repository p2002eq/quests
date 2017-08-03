function event_spawn(e)
	eq.attack_npc_type(56105);
end

function event_signal(e)
	e.self:Say("Victory is mine!");
	eq.depop();
end