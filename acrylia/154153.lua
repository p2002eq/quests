-- a_spiritual_arcanist (Grimling Raid Version) 
-- NPCID: 154153
-- Khati Sha Event (Spirit Ward)

function event_spawn(e)
	eq.set_timer("depop", 60 * 60 * 1000);  -- 60 min depop
	eq.set_timer("leash", 1);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	elseif e.timer == "leash" then
		if e.self:GetY() >= -315 then
			e.self:GotoBind();
			e.self:WipeHateList();
			e.self:SpellFinished(3230,e.self); --balance of the nameless (self dispell)
		end
	end
end

function event_death_complete(e)
	eq.signal(154122,20); --signal #arcanist_trigger to increment death counter
end


