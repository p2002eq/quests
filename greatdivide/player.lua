function event_enter_zone(e)
	eq.set_timer("spires",10000);
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_say(e)
	if e.self:Admin() > 100 then
		if(e.message:findi("stage1")) then
			eq.signal(118351, 1000);
		elseif(e.message:findi("stage2")) then
			eq.signal(118351, 2000);
		elseif(e.message:findi("stage3")) then
			eq.signal(118351, 3000);
		elseif(e.message:findi("narandi")) then
			eq.signal(118351, 4000);
		end
	end
end
