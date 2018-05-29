----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Lashing
-- Zone: Plane of Justice
-- NPC: #a_tormented_prisoner (201455)
-- Controller: #Event_Lashing_Control (201462)
----------------------------------------------------------------------

function event_death_complete(e)
	eq.signal(201462, 2);	--#Event_Lashing_Control (201462)
end