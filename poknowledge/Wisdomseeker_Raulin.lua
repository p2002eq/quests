function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail adventurous traveler! I have been researching the druidic heritages of various Norrathian cultures and have made some interesting finds here in the great library.  Feel free to borrow the books I have found if you like. The sorcery of the library will return the books to their proper places when you are through with them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
