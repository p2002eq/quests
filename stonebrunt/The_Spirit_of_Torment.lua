-- The_Spirit_of_Torment (100501) for BST epic

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
    eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 0, 250, "Sharik the Watcher says 'Your efforts are most brave. The realm of spirits is in constant danger these days. Mortals are tampering with the balance more and more often. Learn from these battles and make note of the importance of balance. The task that you complete this day may mock you in the days to come if you do not heed its lesson. Take care, my friend.'")
end

