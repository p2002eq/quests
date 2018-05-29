--Tallon_Zek (214026)
--potactics

function event_combat(e)
	if e.joined then 
		eq.set_timer("melee_check", 5 * 1000)	--check to cast Avatar Power knockback
		eq.set_timer("shadowstep",math.random(6,18) * 1000);
		eq.set_timer("aggro_check", 6 * 1000);
		eq.set_timer("face",1 * 1000);
	else
		eq.stop_all_timers();
	end
end

function event_timer(e)
	if e.timer == "shadowstep" then
		eq.stop_timer(e.timer);
		eq.set_timer("shadowstep",math.random(6,18) * 1000);
		e.self:GMMove(get_safe_loc(e.self:GetX(),-723,-505), get_safe_loc(e.self:GetY(),-2100, -1800), 200, e.self:GetHeading());	--sets range on where Tallon can shadowstep
		AggroBounce(e);
		e.self:FaceTarget(e.self:GetHateTop());
	elseif e.timer == "melee_check" and eq.PlayerCheck(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75)	then	--added since it did mob AI priority did not use this spell correctly so we have pulled Avatar power from spell list and included in script
		eq.stop_timer(e.timer);
		eq.set_timer("melee_check", 20 * 1000);
		e.self:SpellFinished(808,e.self);	--Avatar Power (PBAOE knockback)		
	elseif e.timer == "aggro_check" then
		local rand = math.random(1,100);
		if rand <= 60 then
			AggroBounce(e);
		end
	elseif e.timer == "face" then
		if e.self:GetHateTop() ~= nil then
			e.self:FaceTarget(e.self:GetHateTop());
		end
	end
end

function AggroBounce(e)
	local target = nil;
	local hate_list = e.self:GetHateList();
	if hate_list ~= nil then
		for mob in hate_list.entries do
			e.self:SetHate(mob.ent,1,1);
			if mob.ent:GetHPRatio() <= 30 and mob.ent:IsClient() then
				target = mob.ent;
			end
		end
	end
	
	if target ~= nil then	--find weaker targets to finish if available
		e.self:SetHate(target,500);	
		return;
	end
	
	for n = 1,10 do
		player = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(),200*200);
		if player.valid and not player:GetGM() then
			e.self:SetHate(player:CastToMob(),500);
			break;
		end
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