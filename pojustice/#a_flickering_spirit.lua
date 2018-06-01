----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Lashing
-- Zone: Plane of Justice
-- NPC: #a_flickering_spirit (201459)
-- Controller: #Event_Lashing_Control (201449)
----------------------------------------------------------------------

function event_death(e)
	e.self:SetLevel(1,true);	--set level 1 so mob doesn't give xp
end

function event_death_complete(e)
	eq.signal(201462, 9); -- #Event_Lashing_Control
end