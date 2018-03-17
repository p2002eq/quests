local instanceId = 0;
local timerCnt = 0;

function event_enter_zone(e)
	instanceId = eq.get_zone_instance_id();
	if(instanceId ~= 0) then
		depop_mobs();
		eq.set_timer("timesup",300000);
		e.self:BuffFadeAll();
		e.self:Message(15,"The goal is to get to the Kobold camp upstairs within 5 minutes, shouldn't be too difficult.  Oh yea, I almost forgot...");
		eq.set_timer("shake",8000);
	end
end

function event_death(e)
	instanceId = eq.get_zone_instance_id();
	if(instanceId ~= 0) then
		e.self:MovePCInstance(112, 0, -62, 532, -174, 132);
		return -1
	end
end

function event_timer(e)
	if (e.timer == "timesup") then
		eq.stop_timer(e.timer);
		eq.stop_timer("shake");
		e.self:Message(15,"You have failed!  Try doing it faster next time.");
		e.self:MovePC(202,-213, -178, -157, 383.8);
	elseif(e.timer == "shake") then
		timerCnt = timerCnt + 1;
		local shakeMod = 0;
		if (timerCnt > 12) then
			shakeMod = 4;
		elseif (timerCnt > 9) then
			shakeMod = 3;
		elseif (timerCnt > 6) then
			shakeMod = 2;
		elseif (timerCnt > 3) then
			shakeMod = 1
		end
		e.self:CameraEffect(23000,9 - shakeMod)
	else
		eq.stop_timer(e.timer);
	end
end

function depop_mobs()
	local npc_list = eq.get_entity_list():GetNPCList();
	if (npc_list ~= nil) then
		for mob in npc_list.entries do
			mob:Depop();
		end
	end
	eq.spawn2(214104, 0, 0, -368, 341, 21, 0);
end