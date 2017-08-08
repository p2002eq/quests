function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("sets down a needle and thread and a bolt of cloth.  'Greetings, my friend!  I am the tailor of this outpost.  We have limited supplies.  I often have to reserve my tailoring supplies to [mend very large items].'");
		e.self:DoAnim(29);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end