function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ". and welcome to New Tanaan. This city holds a great variety of supplies for all tradesmen -- you shall not find such a welcoming host of merchants gathered in one city upon Norrath. I guarantee! Come. if you be a baker. and search my inventory. Perhaps you shall find something of interest or necessity to your search.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
