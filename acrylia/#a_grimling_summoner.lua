--#a_grimling_summoner (Witchdoctor Ring)
--NPC IDS:  154392, 154393, 154394, 154395
--ZONE:  Inner Acrylia

function event_spawn(e)
	deactivate(e.self);
end

function event_timer(e)
	if e.timer == 'activate' then
		eq.stop_timer(e.timer);
		activate(e.self);
	elseif e.timer == 'reset' then
		eq.stop_timer(e.timer);
		deactivate(e.self);
	end
end

function event_death_complete(e)
	eq.signal(154404,20);  --signal WD spawner for emote
end

function event_signal(e)
	if e.signal == 10 then
		eq.set_timer("activate", 1);
	elseif e.signal == 99 then
		eq.set_timer("reset",1)
	end
end

function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:WipeHateList();
end

function activate(mob)
	mob:SetBodyType(7, true);
end

