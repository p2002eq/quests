-- a_spiritual_arcanist (True Selection) 
-- NPCID: 154151
-- Khati Sha Event (Spirit Ward)

function event_spawn(e)
	eq.set_timer("warder_check", 1 * 1000);
end

function event_timer(e)
	if e.timer == "warder_check" then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154148)	then	--checks that surrounding grimling_spiritwarders are dead 
			eq.stop_timer("dialogue");
			eq.stop_timer(e.timer);
			eq.signal(154122,1);  --signals arcanist_trigger to spawn deathguards
			e.self:DoAnim(36);	--kneeling animation
			e.self:Emote("collapses to his knees before you, the strain of the magical field about him obviously weakening him. After a moment, he stands, and says, 'You have chosen wisely, child, but this is only the first step, now you must vanquish this evil being, but beware, I will be unable to help you, as this seal has left me magically drained.");
			eq.depop(154152); --depop false arcanist
			eq.depop_all(154149);	--depop other spiritwarders
		end
	elseif e.timer == "depop" then
		eq.depop();
	end
end

function event_signal(e)
	if e.signal == 1 then 	--signal received upon death of the 4 death guards
		e.self:Emote("is clearly exhausted, speaking only two words before cloaking himself from your field of view. You hear a faint noise near the door, just before several grimlings appear, trying to stop you from entering the door. A voice booms from somewhere inside the caverns, 'Farewell, warriors, and may you possess the strength to vanquish the evil beyond this doorway.");
		eq.depop();
	elseif e.signal == 10 then
		eq.stop_all_timers();
		e.self:SetAppearance(3);
		e.self:Emote("collapses to the floor as the grimling arcanist drains the last of his life force.  Before fading into the ward he manages to say, 'My friends, you have been deceived!'");
		eq.set_timer("depop",10 * 1000);
	elseif e.signal == 80 then
		e.self:Say("Don't listen to him! Unbind me and I can help you.")
	elseif e.signal == 81 then
		e.self:Say("Do not set him free! You shall need my help for this! Free me!")
	elseif e.signal == 82 then
		e.self:Say("He lies! Free me and we shall fight together and destroy that evil being!")
	elseif e.signal == 83 then
		e.self:Say("Help, please! Destroy this barrier I am a prisoner!")
	elseif e.signal == 84 then
		e.self:Say("Faster, please! You must make a decision!")
	elseif e.signal == 85 then
		e.self:Say("He is trying to pressure you, follow your instincts. I am the one you need!");
	end
end




