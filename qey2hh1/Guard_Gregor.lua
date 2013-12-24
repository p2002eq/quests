function event_combat(e)
	if(e.joined == true) then
		e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end