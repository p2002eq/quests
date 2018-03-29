function event_enter_zone(e)
    -- Halloween Event
    --e.self:SetRace(eq.ChooseRandom(58,216,123,230,85,108,151,154,161,131,181,243,252));
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	if(e.self:GetRace() == 330) then
		e.self:MovePC(185,-436.45,604,-87.1,124);
	end
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

-----------------------------------
--POP ALPHA TESTING MODULE
function event_say(e)
	local pop_flags = require("pop_flags");
	pop_flags.options(e)
end

-----------------------------------
