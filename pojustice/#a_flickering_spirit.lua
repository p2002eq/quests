----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Lashing
-- Zone: Plane of Justice
-- NPC: #a_flickering_spirit (201459)
-- Controller: #Event_Lashing_Control (201449)
----------------------------------------------------------------------

function event_death_complete(e)
	eq.signal(201462, 9); -- #Event_Lashing_Control
end