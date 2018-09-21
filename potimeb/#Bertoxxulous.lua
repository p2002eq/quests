-- #Bertoxxulous (223142)
--Phase 5 God
--potimeb

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 5 * 60 * 1000);
	end
end

function event_timer(e)
	if (e.timer == "reset") then
		eq.stop_timer("reset");
		eq.set_next_hp_event(90);
	end
end

--controls min/max hit based on HP %
function event_hp(e)	
	if e.hp_event == 90 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Blisters and festering sores covering Bertoxxulous's hide burst.  A noxious ooze bleeds down his scarred flesh, strengthening his physical body.");
		eq.set_next_hp_event(70);
		SetDamage(e,2);		
	elseif e.hp_event == 70 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Blisters and festering sores covering Bertoxxulous's hide burst.  A noxious ooze bleeds down his scarred flesh, strengthening his physical body.");
		eq.set_next_hp_event(55);
		SetDamage(e,3)
	elseif e.hp_event == 55 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Blisters and festering sores covering Bertoxxulous's hide burst.  A noxious ooze bleeds down his scarred flesh, strengthening his physical body.");
		eq.set_next_hp_event(40);
		SetDamage(e,4)
	elseif e.hp_event == 40 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Bertoxxulous falters, nearly imperceptibly.");
		eq.set_next_hp_event(30);
		SetDamage(e,3);
	elseif e.hp_event == 30 then
		eq.set_next_hp_event(10);
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Bertoxxulous falters, nearly imperceptibly.");
		SetDamage(e,2);
	elseif e.hp_event == 10 then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Bertoxxulous falters, nearly imperceptibly.");
		SetDamage(e,1);
	end		
end

function SetDamage(e,level)
	local damage_tables = {	[1] = {"935","1600"},
								[2] = {"1025","1825"},
								[3] = {"1120","2050"},
								[4] = {"1250","2200"},};

	eq.GM_Message(15,string.format("Strength level:[%s/4] min_hit[%s] max_hit[%s]",level,damage_tables[level][1],damage_tables[level][2]));	--debug
	e.self:ModifyNPCStat("min_hit",damage_tables[level][1]);
	e.self:ModifyNPCStat("max_hit",damage_tables[level][2]);
end

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6);
	eq.set_global(eq.get_zone_instance_id() .. "_potimeb_p5_bertox","Dead",7,"H132");
end