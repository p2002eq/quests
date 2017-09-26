function event_death(e)
	eq.signal(214104,1);
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	local instance_id = eq.get_zone_instance_id();
	local instance_version = eq.get_zone_instance_version();
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());

	--e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

	if(instance_id ~= 0) then
		e.self:Message(15,"You have entered a Instanced Version of the zone.");
	end
end