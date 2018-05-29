--Sergeant_Amon_Tillan 
--ID:208066 
--Zone:povalor

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Well met, " .. e.other:GetName() .. ". Do you hear the call of honor as these brave soldiers I teach do? You would do well to learn from the lessons of your ancestors, for valor is its own reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end