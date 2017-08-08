function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Through this hallway lies the wonderful city of Shadowhaven. The Haven is just that. a haven for those with no home. The city tolerates any race or religion. as long as they keep to themselves and cause no trouble. Good. honest hard work is expected from those that wish to reside in the city. When visiting. proceed to the Fordel quarter and register if you have not done so already. Take care " .. e.other:GetName() .. ".");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end