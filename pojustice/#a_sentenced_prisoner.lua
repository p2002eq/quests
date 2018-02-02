--#a_sentenced_prisoner (201468)
--Trial of Execution
--pojustice

function event_signal(e)	--signal before execution is carried out
	e.self:Emote("bows his head and says nothing.")
end

function event_death_complete(e)
	eq.signal(201471, 2); -- #Event_Execution_Control -- Lost
end