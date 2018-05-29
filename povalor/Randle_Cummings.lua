function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hello there, " .. e.other:GetName() .. ". If you seek to rest your laurels and stock up on food or water for the upcoming struggles ahead, I can provide you with any basic supplies you may need.");
	end
end

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:povalor  ID:208036 -- Randle_Cummings