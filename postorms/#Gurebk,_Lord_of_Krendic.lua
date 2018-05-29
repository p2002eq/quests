--#Gurebk,_Lord_of_Krendic (210472)
--Desert Giant Lord
--Zone: Postorms

local guards={}

function event_spawn(e)
	activated = false;
	eq.set_next_hp_event(97);
end	

function event_hp(e)
	if e.hp_event == 97 then
		guards[1] = eq.spawn2(210466,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	--a_royal_scorpion (210466)
		guards[2] = eq.spawn2(210466,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	--a_royal_scorpion (210466)
		guards[1]:AddToHateList(e.self:GetHateTop(),1);	
		guards[2]:AddToHateList(e.self:GetHateTop(),1);	
		eq.set_next_inc_hp_event(99);
		eq.set_next_hp_event(45);
	elseif e.hp_event == 45 then
		guards[3] = eq.spawn2(210466,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	--a_royal_scorpion (210466)
		guards[4] = eq.spawn2(210466,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	--a_royal_scorpion (210466)
		guards[3]:AddToHateList(e.self:GetHateTop(),1);	
		guards[4]:AddToHateList(e.self:GetHateTop(),1);	
	end
	
	if e.inc_hp_event == 99 then	--should only apply on mob reset
		eq.depop_all(210466);	--a_royal_scorpion (210466)
		eq.set_next_hp_event(97);	--reset hp events
	end
end


function event_signal(e)-- Signal from the death of any appropriate named or trash
	if not trash_check() and not activated then
		activate(e.self);	--activate if trash is cleared
	end
end

function event_timer(e)
	if e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			deactivate(e.self);
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 15 * 1000);
		end
	end
end

function deactivate(mob)
	activated = false;
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);	--will not aggro
	mob:SetSpecialAbility(35, 1);	--no harm from players
	mob:WipeHateList();
	mob:GotoBind();
end

function activate(mob)
	activated = true;
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);	--will not aggro
	mob:SetSpecialAbility(35, 0);	--no harm from players
	eq.set_timer("monitor", 30 * 60 * 1000);	--remain untargetable for 30 minutes at a minimum.  after that point will go untargetable if spawnpoints repop and mob is not engaged
end


function trash_check()	--iterate through related NPC ids
	local mob_table = {210407,210035,210022};

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

