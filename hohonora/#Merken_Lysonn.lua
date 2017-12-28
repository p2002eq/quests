--#Merken_Lysonn (211100)
--Villager's Trial
--hohonora

function event_spawn(e)
	e.self:SetRunning(true);
	eq.set_timer("move", 10 * 1000);
	eq.set_timer("monitor", 1 * 1000);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("monitor");
	else
		eq.set_timer("monitor", 1);
	end
end

function event_timer(e)
	if e.timer == "move" then
		eq.stop_timer(e.timer);
		eq.move_to(641,1374 + math.random(-100,100),-115,-1,true);
	elseif e.timer == "monitor" and e.self:GetX() == 641 and not e.self:IsEngaged() then
		eq.stop_timer("monitor");
		eq.set_timer("fail", 60 * 1000);
	elseif e.timer == "fail" and not e.self:IsEngaged() then
		eq.signal(211123,1); 	--signal a_gnome_villager (fail check mob)
	end
end

