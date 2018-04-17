--A_deep (200033) in Crypt of Decay (FLAVOR)

local started;

function event_spawn(e)
	eq.unload_encounter("Overlord_Banord_Paffa");
	local started = false;
	ProximitySetup(e);
end

function event_enter(e)
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(200020) and not started then-- #Banord_Paffa (200020)
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
		ProximitySetup(e)
		eq.unload_encounter("Overlord_Banord_Paffa");
		started = false;
	end
end

function ProximitySetup(e)
	started = false;
	eq.clear_proximity();
	local x,y,z = e.self:GetX(), e.self:GetY(), e.self:GetZ()	
	eq.set_proximity(x - 10, x + 10, y - 10, y + 10, z - 20, z + 20);
end
		


