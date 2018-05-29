--#a_twisted_spirit (207313)
--encounter adds for Saryrn fight
--potorment

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end