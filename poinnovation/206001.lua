--clockwork_device
--Manaetic Behemoth Event
--poinnovation

function event_timer(e)
	if e.timer == "energy burst" and not e.self:IsEngaged() then
		e.self:SpellFinished(2321,e.self);
		eq.signal(206046,1);  --signal MB that AE has went out.  Will reset activation timer
		eq.depop();
	end
end

function event_waypoint_arrive(e)
	if e.wp == 4 then
		eq.set_timer("energy burst", 2 * 1000);
	end
end