function event_spawn(e)
	eq.attack_npc_type(eq.ChooseRandom(119166,119167,119168,119169));
	eq.set_timer(1,300000);
end

function event_timer(e)
    eq.depop();
end