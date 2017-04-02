-- The_Icebound_Spirit (73107) for BST epic

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
	    eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 0, 250, "Zehkes the Great Storm takes form before you. It growls and sniffs the air. The strange spirit appears to nod at you and then looks to the ground. The bear's form begins to lose shape, as its fur turns to snow and begins to blow away.")
end

