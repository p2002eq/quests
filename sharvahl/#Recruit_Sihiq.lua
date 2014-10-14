function event_signal(e)
	if(e.signal == 1) then
		e.self:SetAppearance(1);
	end
	if(e.signal == 2) then
		e.self:SetAppearance(0);
	end
	if(e.signal == 3) then
		e.self:DoAnim(1); --kick
	end
	if(e.signal == 4) then
		e.self:DoAnim(7); --bash
	end
	if(e.signal == 5) then
		e.self:DoAnim(2); --pierce
	end
	if(e.signal == 6) then
		e.self:DoAnim(4); --2hblunt
	end
	if(e.signal == 7) then
		e.self:DoAnim(3); --2hslash
	end
	if(e.signal == 8) then
		e.self:DoAnim(5); --mainhand
	end
	if(e.signal == 9) then
		e.self:SetAppearance(1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
