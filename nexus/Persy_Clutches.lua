function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the center of Luclin " .. e.other:GetName() .. ". this is a very magical place. The magic that emanates from here can be felt even on the surface. Don't forget to speak to as many of us as you can before you venture far.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end