function event_say(e)
	if(e.message:findi("hail")) then 							--Did not respond to hail on live 01/22/2014
		e.self:Say("Greetings, citizen. Looking for healing or other such services? If so, then I urge you to seek out the Temple of Terror. The hierophants will see to it for you.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("I knew my wicked ways would eventually come to an end. Very well, then. Hand me the legion order and I shall sign it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18245})) then 	--Legion Order (5 signed)
		e.self:Emote("signs the order and hands it back to you.");
		e.other:SummonItem(18246); 								--Legion Order (6 signed)
		e.other:AddEXP(200);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
