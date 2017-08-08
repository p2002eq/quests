function event_say(e)
	if(e.message:findi("special fire emerald")) then
		e.self:Say("Why would you want one of those? Not many people request them, except in special cases. Even you with all your powers can't tell the difference between them. Simply give Drake any fire emerald that you may have and he will make sure you get the special one.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end