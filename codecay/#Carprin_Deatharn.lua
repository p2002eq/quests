--#_Carprin_Deatharn (200007)
--Version 2.0 (spawns once 3 guards are all killed
--codecay


function event_spawn(e)
	eq.set_timer("reset", 3 * 60 * 1000);
end

function event_combat(e)
	if e.joined then
		eq.set_timer("blur", math.random(6,12) * 1000);
	else
		eq.stop_timer("blur");
	end
end

function event_timer(e)
	if e.timer == "reset" then
		if not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
			e.self:GMMove(384,-112,-51,196.8,true);	--Reset at normal Carprin spawn point (necessary since he may spawn off bind-point
		else
			eq.set_timer("reset",1*1000);
		end
	elseif e.timer == "blur" and player_check(e) then
		eq.stop_timer(e.timer);
		eq.set_timer("blur", math.random(6,12)*1000);
		e.self:WipeHateList();
	end
end


function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "Dark laughter sounds from deeper within the chapel as a menacing voice is heard saying, 'Come great corrupter of entropy and decay. Stop these foolish mortals from violating our masters chapel.");
	eq.unique_spawn(200224,0,0,408,157,-58,127); --Avhi_Escron (200224)
end

function player_check(e)
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 30 then
				return true; --client in range
			end
		end
	end
	return false;
end