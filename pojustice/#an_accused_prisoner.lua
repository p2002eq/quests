----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Stoning
-- Zone: Plane of Justice
-- NPC: #an_accused_prisoner (201486)
-- Controller: #Event_Stoning_Control (201505)
----------------------------------------------------------------------

function event_death_complete(e)
	eq.signal(201505, 2); -- #Event_Stoning_Control (201505) -- Lost
end