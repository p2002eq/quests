function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18847})) then	-- Tattered note
		e.self:Say("Welcome " .. e.other:GetName() .. "! The blood of our brothers the wolves run strong through your veins. You must learn to control your spiritual link with our canine brothers. Wear this tunic so that others may recognize you as a Field Priest of the Tribunal, the claws and fangs of justice! Talk to my friend Hoyce and he can get you started.");
		e.other:Ding();
		e.other:Faction(294, 15);   							-- Shamen of Justice
		e.other:Faction(213, 2);   								-- Merchants of Halas
		e.other:Faction(33, -2);   								-- Circle Of Unseen Hands
		e.other:Faction(48, -2); 								-- Coalition of Tradefolk Underground
		e.other:Faction(90, -3); 								-- Ebon Mask
		e.other:SummonItem(13574);   							-- Soiled Gray Tunic
		e.other:AddEXP(100);        							-- Give exp for turning in quest
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
