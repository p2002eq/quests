--Falto,_Lord_of_Thunder (210468)
--Zone: Postorms

function event_spawn(e)
	eq.set_timer("monitor", 30 * 60 * 1000);
end	

function event_combat(e)
	if e.joined then
		eq.stop_timer("monitor");
		eq.set_timer("adds", 15 * 1000);
	else
		eq.set_timer("monitor",15 * 60 * 1000);	
		eq.stop_timer("adds");
	end
end

function event_timer(e)
	if e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			eq.get_entity_list():GetSpawnByID(369023):Repop(5); --#Falto_trigger (210484)			
			eq.depop();
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 15 * 1000);
		end
	elseif e.timer == "adds" then
		eq.stop_timer(e.timer);
		eq.set_timer("adds",90 * 1000);
		spawn_adds(e,2,4);	--spawn adds
	end
end

function trash_check()	--iterate through related NPC ids
	local mob_table = {210458,210459};	--a_blazing_mephit (210458), a_burning_mephit (210459)

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

function spawn_adds(e,low,high)
	local rand = math.random(low,high);
	for n = 1,high do
		mob = eq.spawn2(eq.ChooseRandom(210485,210486),0,0,e.self:GetX() + math.random(-15,15),e.self:GetY() + math.random(-15,15),e.self:GetZ() + 5,e.self:GetHeading());	--#a_blazing_mephit (210485), #a_burning_mephit (210486)
		mob:AddToHateList(e.self:GetHateRandom(),1);
	end
end

function event_death_complete(e)
	tree = eq.get_entity_list():GetMobByNpcTypeID(210482);  ----#a_decrepit_ent (210482)
	eq.spawn2(210483,0,0,tree:GetX(),tree:GetY(),tree:GetZ(),tree:GetHeading());  --#a_vivacious_ent (210483)
	tree:Depop(true);
end