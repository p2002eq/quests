--Animated_Decorin_Blade (214302)
--potactics

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end