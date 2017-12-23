--Saryrn 
--Plane of Torment

-- on aggro, spawn Sorrowsong - grid ID 1 (207052)
-- every 10% spawn 4 blood ravens (207030), signal sorrowsong to restart despawn timer (signal 1)
-- at 20%, tell sorrowsong to become targetable (signal 2)
-- on death, summon planar projection

-- Written by Romai, so you have someone to blame if I botch this :)
--Converted to .lua by Daeron

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_combat(e)
    if (e.self:GetHPRatio() > 10 and e.self:GetHPRatio() < 20) then
      eq.signal(207052,2,1);
      eq.set_next_hp_event(10);
      elseif (e.self:GetHPRatio() > 20 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(207052) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(207065)) then
      eq.spawn2(207052,1,0,53.8,-0.7,579.1,128.9);
      eq.signal(207052,1,0);
      eq.set_next_hp_event(20);
    end
	if (e.self:GetHPRatio() > 90) then
	  eq.signal(207052,1,0);
	  eq.set_next_hp_event(90);
	elseif (e.self:GetHPRatio() > 80) then
	  eq.signal(207052,1,0);
	  eq.set_next_hp_event(80);
	elseif (e.self:GetHPRatio() > 70) then
	  eq.signal(207052,1,0);
	  eq.set_next_hp_event(70);
	elseif (e.self:GetHPRatio() > 60) then
	  eq.signal(207052,1,0);
	  eq.set_next_hp_event(60);
	elseif (e.self:GetHPRatio() > 50) then
	  eq.signal(207052,1,0);
	  eq.set_next_hp_event(50);
	elseif (e.self:GetHPRatio() > 40) then
	  eq.signal(207052,1,0);
	  eq.set_next_hp_event(40);
	elseif (e.self:GetHPRatio() > 30) then
	  eq.signal(207052,1,0);
	  eq.set_next_hp_event(30);
	end
end
     
function event_hp(e)
	if (e.hp_event == 90) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,1,0);
		eq.set_next_hp_event(80);
		eq.set_next_inc_hp_event(98);
	elseif (e.hp_event == 80) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,1,0);
		eq.set_next_hp_event(70);
	elseif (e.hp_event == 70) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,1,0);
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,1,0);
		eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,1,0);
		eq.set_next_hp_event(40);
	elseif (e.hp_event == 40) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,1,0);
		eq.set_next_hp_event(30);
	elseif (e.hp_event == 30) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,1,0);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
		eq.signal(207052,2,1);
		eq.set_next_hp_event(10);
	elseif (e.hp_event == 10) then
		eq.spawn2(207030,0,0,(e.self:GetX() +  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,(e.self:GetX() -  5),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() + 5),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(207030,0,0,e.self:GetX(),(e.self:GetY() - 5),e.self:GetZ(),e.self:GetHeading());
	end
	
	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(90);
	end
end

function event_death_complete(e)
	eq.spawn2(218068,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Planar Projection
end