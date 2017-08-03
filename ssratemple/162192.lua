-- #Rhag`Mozdezh (162192) for Rhag cycle AKA Rhag 2

function event_death_complete(e)
	eq.unique_spawn(162517, 0, 0, 418, -141, 264, 0); -- spawn Arch Lich
	eq.unique_spawn(162518, 0, 0, 448, -161, 265, 224);  -- AL guard
	eq.unique_spawn(162519, 0, 0, 390, -161, 265, 32);  -- AL guard
	eq.spawn2(162090, 0, 0, 375, -64, 257, 64);  -- AL guard
	eq.spawn2(162090, 0, 0, 467, -64, 257, 192);  -- AL guard
	eq.set_global("AL_Cycle_ArchLich","UP",3,"F");  --sets global to "AL" to indicate Arch Lich as next target up in cycle in case of zone crash/reboot
	eq.delete_global("AL_Cycle_Rhag2");
end
