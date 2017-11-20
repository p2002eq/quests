-- a_spiritual_arcanist (False Selection) 
-- NPCID: 154151
-- Khati Sha Event (Spirit Ward)

local counter = 0;

function event_spawn(e)
	eq.set_timer("warder_check", 1 * 1000);
	eq.clear_proximity();
	eq.set_proximity(510, 535, -335, -315);
	counter = 0;
end

function event_timer(e)
	if e.timer == "warder_check" then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154149)	then	--checks that surrounding grimling_spiritwarders are dead 
			eq.stop_timer("dialogue");
			eq.stop_timer(e.timer);
			eq.signal(154122,1);  --signals arcanist_trigger to spawn deathguards
			eq.signal(154151,10); --signal true arcanist for failure emote
			eq.depop_all(154148);	--depop other spiritwarders
			eq.spawn2(154153,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(), e.self:GetHeading());	--spawn grimling version of spiritual arcanist
			eq.depop();
		end
	end
end

function event_timer(e)
	if e.timer == "dialogue" then
		counter = counter + 1;
		if counter == 1 then
			e.self:Say("Psst, come here. This way. Tear down this barrier of magic, set me free!")
			eq.stop_timer(e.timer);
			eq.set_timer("dialogue", 20 * 1000);
			eq.signal(154151,80);
		elseif counter == 2 then
			e.self:Say("Can't you see?  We are not the same! See the truth and make haste!")
			eq.stop_timer(e.timer);
			eq.set_timer("dialogue", 40 * 1000);
			eq.signal(154151,81, 20 * 1000);
		elseif counter == 3 then
			e.self:Say("Listen carefully, you must choose wisely, only one of us can help you. Please break this circle and let me free!")
			eq.signal(154151,82, 20 * 1000);
		elseif counter == 4 then
			e.self:Say("Help, please! Destroy this barrier I am a prisoner!")
			eq.signal(154151,83, 20 * 1000);
		elseif counter == 5 then
			e.self:Say("We've become magically locked inside these seals, and these grimlings have been set here to reinforce the circle! Defeat these grimlings, and free me!")
			eq.signal(154151,84, 20 * 1000);
		elseif counter == 6 then
			e.self:Say("Break the circle, and break the seal! Time is growing short.")
			eq.signal(154151,85, 20 * 1000);
			counter = 1;
		end
	end
end
			
function event_enter(e)
	if not started then		
		started = true;
		eq.set_timer("dialogue", 1 * 1000);
	end
end



