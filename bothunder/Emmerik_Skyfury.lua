--Emmerik_Skyfury (209053)
--zone: bothunder

function event_combat(e)
	if e.joined then
		eq.set_timer("storms", 30 * 1000);
	end
end

function event_timer(e)
	if e.timer == "storms" then
		if e.self:IsEngaged() then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Emmerik raises his arm high above his head.  Great bolts of energy surge through him and strike the portals.");
			eq.signal(209102,1); --signal adds to spawn via A_celestial_portal (209102)
			eq.stop_timer(e.timer);
			eq.set_timer("storms",2*60*1000);
		else
			eq.stop_timer(e.timer);
		end
	end
end

function event_death_complete(e)
	eq.spawn2(209154,0,0,-1074,-1732,1727,64);	--#_Askr_the_Lost_ (209154)
end

		