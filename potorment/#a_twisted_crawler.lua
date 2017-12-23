function event_death_complete(e)

    --depop the untargetable Tylis
    eq.depop_with_timer(207081);
	--spawn a targetable Tylis
	eq.spawn2(207014,0,0,-1,-7,468,99.5);
	--depop all the minions
	eq.depopall(207069);
	--set maareq's respawn, without this line he will repop on zone reset
	--eq.update_spawn_timer(42165,43200000); --fixed respawn
	eq.update_spawn_timer(42165,(math.random(1,4320)+41040)*1000); --respawn with variance
end