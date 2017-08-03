function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail seeker of knowledge. There is much to be learned here in New Tanaan of the dark gods of Norrath. I have been searching the great library for tomes pertaining to my patron Bertoxxulous. the Plague Lord and made some interesting finds. If you wish to study the tomes I have uncovered you may borrow them and they will be returned to me by the magic of New Tanaan when you are through.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
