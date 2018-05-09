--Anival_the_Blade (214288)
--spawned split version with no loot table
--potactics

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end

