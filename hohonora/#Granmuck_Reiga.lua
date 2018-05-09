--#Granmuck_Reiga (211094)
--Villager's Trial
--hohonora

function event_spawn(e)
	e.self:SetRunning(true);
	eq.set_timer("monitor", 1);
	eq.set_timer("move",1);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("monitor");
	else
		eq.set_timer("monitor", 1);
	end
end

function event_timer(e)
	if e.timer == "move" and e.self:GetWaypointID() == 3 and e.self:GetX() == 785 and not e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.move_to(641,1374 + math.random(-100,100),-115,-1,true);
	elseif e.timer == "monitor" and e.self:GetX() == 641 and not e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		eq.set_timer("fail", 60 * 1000);
		eq.pause(3000);
	elseif e.timer == "fail" and not e.self:IsEngaged() then
		eq.signal(211123,1); 	--signal a_gnome_villager (fail check mob)
	end
end
