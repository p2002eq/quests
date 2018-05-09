--Katizm_Banum
--ID:208056 
--Zone:povalor  

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hail, " .. e.other:GetName() .. ".  You can just call me Banum. Just [" .. eq.say_link("exploring") .. "] are you?"); 
	elseif e.message:findi("exploring") then
		e.self:Say("Be careful out there. I have heard of the glass playing tricks on people's eyes.");
	end
end

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end