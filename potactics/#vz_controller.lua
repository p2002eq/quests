--#vz_controller (214303)
--controller for Vallon Zek event
--potactics

local counter;
local started;

function event_spawn(e)
	counter = 0;
	started = false;
end

function event_signal(e)	--send signal to controller to get event stage

	if e.signal == 1 then	--returned signal that event not yet at final phase
		if counter ~= nil then --redundancy for quest error handling
			if counter < 5 and started then
				eq.signal(214295,1);	--Vallon_Zek (214295)
			elseif counter == 5 and started then
				eq.signal(214295,2);	--final phase
				counter = 0;
			end
		end
	elseif e.signal == 10 then	--signals real VZ phase killed
		if not started then
			started = true;
		end
		counter = counter + 1;
		spawn_wave(e)
	elseif e.signal == 99 then	--reset event
		started = false;
		counter = 0;
	end
end

function spawn_wave(e)
	for n = 1,4 do
		eq.spawn2(214300,0,0,-640 + math.random(-50,50),1980 + math.random(-50,50),230,128);	--Vallon_Zek_ (214300) -- FAKE
	end
	eq.spawn2(214295,0,0,-640 + math.random(-50,50),1980 + math.random(-50,50),230,128);	--Vallon_Zek_ (214300) -- REAL
end
		
