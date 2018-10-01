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
	-- Halloween Event
	e.self:SetRace(eq.ChooseRandom(469,466,464,458,455,454,420,419,418,417,414,413,412,411,406,400,398,396,393,384,355,336));
end
