----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Lashing
-- Zone: Plane of Justice
-- NPC: #Lashman_Azakal (201461)
-- Controller: #Event_Lashing_Control (201449)
----------------------------------------------------------------------

function event_death_complete(e)
	eq.signal(201462, 1); -- #Event_Lashing_Control -- WIN
end
