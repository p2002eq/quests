function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. ". behind me lies the path to the Odus platform. Please refrain from combat while in the Nexus as we have not thoroughly tested how the teleporters would react if exposed to certain magics.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end