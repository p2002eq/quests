--a_tumultuous_storm (210467)
--event spawns for Faruek_the_Bold and Paruek_The_Strong, Pendubk the Turbulent, and Zertuken the Unyielding.
--postorms

function event_combat(e)	--storms will always be assigned a player on their hatelist upon being spawned
	if e.joined then
		eq.set_timer("depop", 5 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" and not e.self:IsEngaged() then
		eq.depop();
	end
end

function event_death(e)
	eq.depop();
end