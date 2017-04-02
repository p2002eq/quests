-- The_Spirit_of_Rage (94247) for BST epic

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
    eq.local_emote({ e.self:GetX(), e.self:GetY(), e.self:GetZ() }, 0, 250, "Omakin the Stalker looks at you with a kind expression. The large creature smiles at you and motions for you to move away. Perhaps it senses that you have more adventure ahead of you. Its form begins to loosen, as if it were a mirage produced by the jungle heat.")
end
