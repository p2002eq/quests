--Solnebk_the_Unruly (210033)
--spawns 5-10 a_tumultuous_storm (210467) adds on intervals when engaged
--postorms

function event_combat(e)
	if e.joined then
		eq.set_timer("storms", 30 * 1000);
	else
		eq.stop_timer("storms");
	end
end

function event_timer(e)
	if e.timer == "storms" and e.self:IsEngaged() and player_check(e) then
		rand = math.random(5,10);
		for n = 1,rand do
			storm = eq.spawn2(210467,0,0,e.self:GetX() + math.random(-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading());	--a_tumultuous_storm (210467)
			storm:AddToHateList(e.self:GetHateRandom(),1);
		end
	end
end

function player_check(e)
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 30 and not client:GetFeigned() then	--checks client in range and not FD (to not spawn mobs during pull/split)
				return true; --client in range
			end
		end
	end
	return false;
end