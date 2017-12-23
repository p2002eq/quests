-- TRIGGER: 
--  signal in 214056 - Decorin Berik dead, start/check timers
--  signal in 214057 - Decorin Grunhork dead, start/check timers
-- 	signal in 214111 - event Vallon is dead, start timer/check timer
--	signal in 214108 - event Tallon is dead, start timer/check timer
--	signal in 214052 - mini rallos dead, check timer/spawn rallos
--	signal in 214113 - RZtW dead, depop
-- 	blank signal out - despawn specified mob


local Berik;
local Grunhork;
local event_vallon;
local event_tallon;

function event_spawn(e)
	Berik = 0;
	Grunhork = 0;
	event_vallon = 0;
	event_tallon = 0;
end

function event_signal(e)        
	if (e.signal == 214056) then        -- Decorin Berik dead
		Berik = 1;
		  
		if (Grunhork == 1) then   -- Spawn Vallon and Tallon
			eq.stop_timer("Decorin");
			eq.set_timer("VTZek", 30*60*1000); -- 30min to kill the Zek brothers
			eq.spawn2(214111,188,0,996,580,133.1,192.5);
			eq.spawn2(214108,187,0,996,-559,133.1,192.5);
			
			Berik = 0;
			Grunhork = 0;
		else
			eq.set_timer("Decorin", 6*60*1000); -- 6min to kill other
		end
	elseif (e.signal == 214057) then        -- Decorin Grunhork dead
		Grunhork = 1;
		
		if (Berik == 1) then   -- Spawn Vallon and Tallon
			eq.stop_timer("Decorin");
			eq.set_timer("VTZek", 1800); -- 30min to kill the Zek brothers
			eq.spawn2(214111,188,0,996,580,133.1,192.5);
			eq.spawn2(214108,187,0,996,-559,133.1,192.5);
			
			Berik = 0;
			Grunhork = 0;
		else
			eq.set_timer("Decorin", 6*60*1000); -- 6min to kill other
		end
	elseif (e.signal == 214111) then	-- Event Vallon Dead
		event_vallon = 1;

		if (event_tallon == 1) then	-- check if Event Tallon is dead
			eq.stop_timer("VTZek");
			eq.signal(214052,0);	-- tell fake Rallos to spawn Mini Rallos
			eq.set_timer("Mini", 30 * 60 * 1000); -- 30min to "kill" mini Rallos
			event_vallon = 0;
			event_tallon = 0;
		end
	elseif (e.signal == 214108) then	-- event Tallon dead
		event_tallon = 1;

		if (event_vallon == 1) then -- check if event Vallon is dead
			eq.stop_timer("VTZek");
			eq.signal(214052,0);	-- tell fake Rallos to spawn Mini Rallos
			eq.set_timer("Mini", 30*60*1000); -- 30min to "kill" mini Rallos
			event_vallon = 0;
			event_tallon = 0;
		end 			
	elseif (e.signal == 214052) then	-- Mini Rallos done
		eq.stop_timer("Mini");
		eq.spawn2(214113,0,0,550,24,-294.9,64.2);
	elseif (e.signal == 214113) then	--RZtW dead, depop
		eq.update_spawn_timer(214123,432000);
		eq.depop_with_timer();
	end
end

function event_timer(e)
	if (e.timer ==  "Decorin") then -- times up to kill Decorins
		eq.stop_timer("Decorin");
		eq.signal(214056, 0);
		eq.signal(214057, 0);
		Berik = 0;
		Grunhork = 0;
	elseif (e.timer ==  "VTZek") then	-- times up, despawn Zeks
		eq.stop_timer("VTZek");
		eq.signal(214111);
		eq.signal(214108);
		event_vallon = 0;
		event_tallon = 0;
	elseif (e.timer ==  "Mini") then		-- times up, despawn mini rallos
		eq.stop_timer("Mini");
		eq.signal(214109);
	end
end

-- End of File	Zone: PoTactics	ID: 214123	-- --rallos_trigger
--Converted to LUA by Daeron