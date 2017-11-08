-- a_spiritual_arcanist (Grimling Raid Version) 
-- NPCID: 154153
-- Khati Sha Event (Spirit Ward)

function event_spawn(e)
	e.self:Shout("You fools chose wrong!  You will not break the final seal!");
	eq.set_timer("depop", 60 * 60 * 1000);  -- 60 min depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(154122,20); --signal #arcanist_trigger to increment death counter
end


