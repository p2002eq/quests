--#Drornok_Tok_Vo`Lok
--Zone: Postorms

local adds = {}

function event_spawn(e)
	activated = false;
	eq.set_next_hp_event(97);
	eq.set_timer("monitor", 30 * 60 * 1000);
	spawn_frogs();
end	

function event_combat(e)
	if e.joined then
		eq.stop_timer("monitor");
	else
		eq.set_timer("monitor",30*60*1000);
	end
end

function event_hp(e)	--spawns 2 waves of adds during fight
	if e.hp_event == 97 then
		adds[1] = eq.spawn2(get_mob(),0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	
		adds[2] = eq.spawn2(get_mob(),0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	
		adds[1]:AddToHateList(e.self:GetHateTop(),1);	
		adds[2]:AddToHateList(e.self:GetHateTop(),1);	
		eq.set_next_inc_hp_event(99);
		eq.set_next_hp_event(50);
	elseif e.hp_event == 50 then
		adds[3] = eq.spawn2(get_mob(),0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	
		adds[4] = eq.spawn2(get_mob(),0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	
		adds[3]:AddToHateList(e.self:GetHateTop(),1);	
		adds[4]:AddToHateList(e.self:GetHateTop(),1);	
	end
	
	if e.inc_hp_event == 99 then	--should only apply on mob reset
		for _,mob in pairs(adds) do
			mob:Depop(false);
		end
		eq.set_next_hp_event(97);	--reset hp events
	end
end

function event_timer(e)
	if e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			eq.get_entity_list():GetSpawnByID(369020):Repop(5); --#Drornok_trigger (210478)
			eq.depop();
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 15 * 1000);
		end
	end
end

function get_mob()
	frog = eq.ChooseRandom(210084,210046,210040,210047);	--a_vacillating_loktole (210084, a_hurricane_loktole (210046), a_typhoon_amphan (210040), a_tempest_toad (210047)
	return frog;
end

function trash_check()	--iterate through related NPC ids
	local mob_table = {210084,210046,210040,210047};	--a_vacillating_loktole (210084, a_hurricane_loktole (210046), a_typhoon_amphan (210040), a_tempest_toad (210047)

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

function spawn_frogs()		--spawn random frogs around pond
	eq.spawn2(get_mob(),0,0,-267,-50,-406,76);
	eq.spawn2(get_mob(),0,0,97,14,-398,14);
	eq.spawn2(get_mob(),0,0,217,-169,-409,502);
	eq.spawn2(get_mob(),0,0,134,-370,-411,4);
	eq.spawn2(get_mob(),0,0,68,-414,-412,14);
	eq.spawn2(get_mob(),0,0,0,-440,-414,14);
	eq.spawn2(get_mob(),0,0,-151,-450,-396,22);
	eq.spawn2(get_mob(),0,0,-225,-397,-403,32);
	eq.spawn2(get_mob(),0,0,-254,-320,-410,44);
	eq.spawn2(get_mob(),0,0,-301,-256,-412,56);
	eq.spawn2(get_mob(),0,0,-308,-191,-408,62);
	eq.spawn2(get_mob(),0,0,-289,-108,-409,70);
	eq.spawn2(get_mob(),0,0,-221,-6,-415,72);
	eq.spawn2(get_mob(),0,0,-174,45,-404,80);
	eq.spawn2(get_mob(),0,0,-101,58,-402,72);
	eq.spawn2(get_mob(),0,0,-23,58,-411,48);
	eq.spawn2(get_mob(),0,0,43,59,-408,28);
	eq.spawn2(get_mob(),0,0,146,-27,-406,508);
	eq.spawn2(get_mob(),0,0,203,-109,-411,506);
	eq.spawn2(get_mob(),0,0,221,-228,-405,510);
	eq.spawn2(get_mob(),0,0,202,-305,-412,10);
	eq.spawn2(get_mob(),0,0,164,-343,-404,42);
end
