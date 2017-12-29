--A_deep (200033) in Crypt of Decay (FLAVOR)

local started;

function event_spawn(e)
	local started = false;
	eq.set_timer("prox_refresh", 5 * 1000);
	ProximitySetup(e);
end

function event_timer(e)
	if e.timer == "prox_refresh" then
		ProximitySetup(e);
	end
end

function event_enter(e)
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(200020) and not started then-- #Banord_Paffa (200020)
		eq.stop_timer("prox_refresh");
		e.self:Emote("voice bellows from just ahead saying, 'Come fools see if you can match the power of Banord and his puslings.  Puslings come your master has need of you!' Wretched howls of the twisted puslings begin to echo throughout the room.");
		eq.load_encounter("Overlord_Banord_Paffa");
		started = true;
	end
end

function event_signal(e)
	if e.signal == 1 then	--encounter won
		eq.unload_encounter("Overlord_Banord_Paffa");
		eq.depop_with_timer();
	elseif e.signal == 2 then	--reset signal - encounter failed
		eq.set_timer("prox_refresh", 5 * 1000);
		eq.unload_encounter("Overlord_Banord_Paffa");
		started = false;
	end
end

function ProximitySetup(e)
	started = false;
	eq.clear_proximity();
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end
		


