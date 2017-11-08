-- a_spiritual_arcanist (False Selection) 
-- NPCID: 154151
-- Khati Sha Event (Spirit Ward)

function event_spawn(e)
	eq.set_timer("dialogue",15 * 1000);
	eq.set_timer("warder_check", 1 * 1000);
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




