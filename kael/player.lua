--LUA for Iceshard Keep (AKA Kael Plate Cycle House)

function event_say(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.message:findi("The dain shall be slain for the peace we must obtain")) then	-- trigger phrase
		if (qglobals["platecycle"] == nil) then
			myX = e.self:GetX();
			myY = e.self:GetY();
			if(between(myX, 1115, 1175) and between(myY, -870, -810)) then -- check for distance from throne
				eq.unique_spawn(113636, 0, 0, 1125, -839.0, -120.80, 70);  -- spawns Doldigun on Throne to start trigger of cycle
				eq.set_global("platecycle","1",3,"H2");
			end
		end
	end
end

function between(loc, limit_low, limit_high) -- helper function to check that values are between targets
	if(loc <= limit_high and loc >= limit_low) then
		return true
	else
		return false
	end
end

function event_enter_zone(e)
	local instance_id = eq.get_zone_instance_id();
	local instance_version = eq.get_zone_instance_version();
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());

	--e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

	if(instance_id ~= 0) then
		e.self:Message(15,"You have entered an Instanced Version of the zone.");
	end
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end