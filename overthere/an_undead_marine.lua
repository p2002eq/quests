function event_signal(e)
	if (e.signal == 1) then
		if((x==2146 and e.self:GetY()==2445) or (e.self:GetX()==2151 and e.self:GetY()==2440) or (e.self:GetX()==2136 and e.self:GetY()==2453) or (e.self:GetX()==2124 and e.self:GetY()==2465) or (e.self:GetX()==2130 and e.self:GetY()==2459) or (e.self:GetX()==2142 and e.self:GetY()==2448)) then
			e.self:Say("Sir, yes sir!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
