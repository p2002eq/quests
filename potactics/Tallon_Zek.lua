--Tallon_Zek (214026)
--potactics

function event_combat(e)
	if e.joined then 
		eq.set_timer("melee_check", 5 * 1000)	--check to cast Avatar Power knockback
		eq.set_timer("shadowstep",math.random(6,24) * 1000);
	else
		eq.stop_timer("shadowstep");
		eq.stop_timer("melee_check");
	end
end

function event_timer(e)
	if e.timer == "shadowstep" then
		eq.stop_timer(e.timer);
		eq.set_timer("shadowstep",math.random(6,24) * 1000);
		e.self:GMMove(get_safe_loc(e.self:GetX(),-723,-505), get_safe_loc(e.self:GetY(),-2100, -1800), 200, e.self:GetHeading());	--sets range on where Tallon can shadowstep
		e.self:FaceTarget(e.self:GetTarget());
		
		--chance to wipe hate list
		local memwipe = math.random(1,100);
		if memwipe > 40 then
			e.self:WipeHateList();
		end
	elseif e.timer == "melee_check" and player_check(e)	then	--added since it did mob AI priority did not use this spell correctly so we have pulled Avatar power from spell list and included in script
		eq.stop_timer(e.timer);
		eq.set_timer("melee_check", 20 * 1000);
		e.self:CastSpell(808,e.self:GetID());	--Avatar Power (PBAOE knockback)		
	end
end
		

function event_death_complete(e)
	eq.spawn2(214305,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--A_Planar_Projection (214305)
end

function get_safe_loc(current,min_loc,max_loc)
	local leash = 100;  --100 units max port distance
	local safe_loc = false;
	while not safe_loc do
		destination = current + math.random(-1 * leash,leash);
		if destination > min_loc and destination < max_loc then
			return destination;
		end
	end
end

function player_check(e)
	local client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 75 then
				return true;	--client found in melee range - cast knockback
			end
		end
	end
	return false;	--no clients in range
end