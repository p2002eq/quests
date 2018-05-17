--#event_control_Xegony (215436)
--Controller for Xegony Event
--poair

local spawn_table = {366101, 366152, 366284, 366715, 367134,366314, 366857, 367416, 366998, 367302, 365401, 366167, 367007, 367306, 367517,365447, 366930, 367528, 366146, 365304,366040, 366441, 365559, 365466, 365773, 366744, 367102, 366211, 365683, 366302 };

function event_spawn(e)
	started = false;
	eq.unload_encounter("Xegony_Event");
end

function event_signal(e)
	if e.signal == 1 then 
		if not started  then	--confirms event not started
			started = true;
			eq.load_encounter("Xegony_Event");
		end
	elseif e.signal == 2 then	--encounter won, unload event
		started = false;
		eq.unload_encounter("Xegony_Event");
		eq.set_timer("reset",30 * 60 * 1000);	--depop any event named if left up after Xegony is dead
	elseif e.signal == 3 then	--event reset
		started = false;
		eq.unload_encounter("Xegony_Event");
		DepopEvent();
		Repop();
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer(e.timer);
		DepopEvent();
		Repop();
	end
end

function Repop()
	for _,spawns in pairs(spawn_table) do
		local mob = eq.get_entity_list():GetSpawnByID(spawns);
		mob:Repop(5);
	end
end

function DepopEvent()
	local event_mobs = {215047,215416,215048,215414,215049,215421,215050,215399,215051,215422,215052,215418} 
	for k,v in pairs(event_mobs) do
		eq.depop_all(v);
	end
end


