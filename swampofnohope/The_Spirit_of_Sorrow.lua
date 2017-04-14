-- The_Spirit_of_Sorrow (83476) for BST epic

function event_spawn(e)
	eq.set_timer('depop', 60 * 60 * 1000) -- 60 minute depop timer
end

function event_timer(e)
	eq.stop_timer(e.timer)
	if e.timer == 'depop' then
		eq.depop()
	end
end

function event_death_complete(e)
    eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 0, 250, "Herikol the Lurker sits motionless for a moment, as if pondering its location. Its form turns to water and slowly begins to melt away.")
end

