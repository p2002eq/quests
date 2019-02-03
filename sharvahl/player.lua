function event_say(e)
    myX = e.self:GetX()
    myY = e.self:GetY()
    if(e.message:findi("Lumanes")) and (between(myX, 530, 580) and between(myY, -590, -550)) and e.self:IsSitting() then
        eq.signal(155337,1,1);
    elseif(e.message:findi("able to help")) and (between(myX, 530, 580) and between(myY, -590, -550)) and e.self:IsSitting() then
        eq.signal(155337,2,1);
    end
end

function between(my_value,min_value,max_value)
	if (my_value >= min_value and my_value <= max_value) then
		return true;
	else
		return false;
	end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());
end