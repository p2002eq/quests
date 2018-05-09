
function event_say(e)
	if e.message:findi("hail") then
		e.self:Say(string.format("Hello there. Forgive me for staring, but it seems more and more of your kind have been passing through here each day. You sure are a curious %s.", string.lower(e.other:Race())));
	end
end

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:povalor  ID:208063 -- Xaven_White