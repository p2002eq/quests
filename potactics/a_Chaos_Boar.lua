--a_Chaos_Boar (214309)
--Rallos Zek the Warlord Event
--potactics

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop")
	else
		eq.set_timer("depop", 15 * 60 * 1000);	--15 min depop
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end