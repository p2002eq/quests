function event_say(e)

end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10629})) then
		e.self:Say("Brokk sorry, me no smush Bozlum's perty garden on purpose. Me felt bad and me too shy to go tell Boz Brokk sorry. Umm....go give her these perty flowers. Dem smell good and maybe make Bozlum feel better.");
		e.other:SummonItem(10630);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
