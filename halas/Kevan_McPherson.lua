function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetName() .. "! I'm Kevan McPherson, the best darn smith in the north. Have ye come to purchase my finely crafted weapons or are ye wanting me ta teach ya the secrets of Northman smithing?");
	end
end


function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end