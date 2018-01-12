--Saryrn (207001)
--Plane of Torment

function event_spawn(e)
	eq.depop_all(207052);	--Depop Sorrowsong (207052)
	eq.get_entity_list():GetSpawnByID(346761):Repop(5);	--Repop Sorrowsong (207052)
	eq.set_next_hp_event(98);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 5 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer(e.timer);
		if not e.self:IsEngaged() then
			eq.set_next_hp_event(98);
			started = false;
			eq.depop_all(207052);	--Depop Sorrowsong (207052)
			eq.get_entity_list():GetSpawnByID(346761):Repop(5);	--Repop Sorrowsong (207052)
		else
			eq.set_timer("reset", 15 * 1000);
		end
	end
end
		
     
function event_hp(e)		--spawns random ravens every 10% and SorrowSong becomes targetable at 25%
	if (e.hp_event == 98) then
		eq.set_next_hp_event(90);
		e.self:Say("Sorrowsong, sing for us.  We want these wretches to enjoy their stay, don't we?");
		eq.signal(207052,1);
	elseif (e.hp_event == 90) then
		spawn_ravens(e);
		eq.set_next_hp_event(80);
	elseif (e.hp_event == 80) then
		spawn_ravens(e);
		eq.set_next_hp_event(70);
	elseif (e.hp_event == 70) then
		spawn_ravens(e);
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then
		spawn_ravens(e);
		eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
		spawn_ravens(e);
		eq.set_next_hp_event(40);
	elseif (e.hp_event == 40) then
		spawn_ravens(e);
		eq.set_next_hp_event(30);
	elseif (e.hp_event == 30) then
		spawn_ravens(e);
		eq.set_next_hp_event(25);
	elseif (e.hp_event == 25) then
		eq.set_next_hp_event(20);
		e.self:Say("This filth is proving to be a challenge!  Sorrowsong, attack these mortals!");
		eq.signal(207052,2);	--activate Sorrowsong (207052)
	elseif (e.hp_event == 20) then
		spawn_ravens(e);
		eq.set_next_hp_event(10);
	elseif (e.hp_event == 10) then
		spawn_ravens(e);
	end
end

function spawn_ravens(e)
	rand = math.random(4,5);
	mob = eq.ChooseRandom(207301,207313);	--#A_summoned_servant (207301) or #a_twisted_spirit (207313)
	for n = 1,rand do
		raven = eq.spawn2(mob,0,0,-2 + math.random(-50,50), -64 + math.random(-50,50), 583, 0); 	
		raven:AddToHateList(e.self:GetHateRandom(),1);
		eq.set_timer("depop", 3 * 60 * 1000, raven);	--start depop timer)
	end
end

function event_death_complete(e)
	eq.spawn2(221045,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Planar Projection
end