--#Rallos_Zek (223168)
--Phase 5 God
--potimeb

local event_mobs = {223229,223230};

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset",5 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer("reset");
		eq.set_next_hp_event(90);
		for k,v in pairs(event_mobs) do
			eq.depop_all(v);
		end
	end
end


function event_hp(e)
	e.self:Emote("roars a mighty war cry and swings his axe with a vengeance.");
	if (e.hp_event == 90) then
		SpawnAdds();
		eq.set_next_hp_event(75);
	elseif (e.hp_event == 75) then
		SpawnAdds();
		eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
		SpawnAdds();
		eq.set_next_hp_event(25);
	elseif (e.hp_event == 25) then
		SpawnAdds(5);
	end
end

function SpawnAdds(num)	
	--always spawns 4 adds
	for n = 1,2 do
		eq.spawn2(223229,0,0,262,-280,5,449);	--a_summoned_minion
		eq.spawn2(223230,0,0,262,-280,5,449);	--a_summoned_boar
	end
	--5th add for last hp event
	if (num == 5) then eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); end
end


function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6);
	eq.set_global(eq.get_zone_instance_id() .. "_potimeb_p5_rallos","Dead",7,"H132");
end