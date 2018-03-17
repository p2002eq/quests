-- a_reanimated_prisoner (154157)
-- Khati Sha Event

function event_spawn(e)
	e.self:Say("I have been called back to serve the Life Ward, and so I shall. Your death awaits!")
end

function event_death_complete(e)
	e.self:Emote("'s corpse crumbles to the ground.")
end
