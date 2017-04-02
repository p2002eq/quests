-- #The_Spirit_of_Malevolence (57119) for BST epic

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
        eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 0, 250, "Khaliz the Mistrunner appears in the misty corpse of the fallen spirit. The mist that makes up its shape then begins to dissipate.")
end

