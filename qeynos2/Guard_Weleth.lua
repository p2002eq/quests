function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s. My name is Weleth Nagoh. In addition to my patrol, I am in charge of keeping the guardhouse stocked with supplies. I must get back to my duties. Farewell.",e.other:GetName()));
	elseif(e.message:findi("crate")) then
		e.self:Say("Oh, we just received a shipment of [" .. eq.say_link("arrows") .. "] from [" .. eq.say_link("Nesiff") .. "] in South Qeynos. The arrows in this box are missing their fletchings and I can't leave my patrol to take them back.");
	elseif(e.message:findi("nesiff")) then
		e.self:Say("Nesiff Tallaherd owns the wooden weapons shop in Merchant's Square in South Qeynos.");
	elseif(e.message:findi("arrows")) then
		e.self:Say("Oh, thank you! Here is the crate. Make sure [" .. eq.say_link("Nesiff") .. "] sends me back a new invoice. Lieutenant Dagarok would have my head if he found out this happened again!");
		e.other:SummonItem(13925); -- Crate of Defective Arrows
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18824})) then -- Slip of Parchment
		e.self:Say("Thank you so much for the favor. Please be careful here in Qeynos. I have come to suspect that even some of my fellow guards are not to be trusted - Lieutenant Dagarok, for one.");
		local random_cp = math.random(8);
		e.other:Ding();
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(9,10,0); -- Antonius Bayle
		e.other:Faction(33,-20,0); -- Circle Of Unseen Hands
		e.other:Faction(53,-20,0); -- Corrupt Qeynos Guards
		e.other:Faction(217,10,0); -- Merchants of Qeynos
		e.other:AddEXP(8000);
		e.other:GiveCash(random_cp,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 8) then
		e.self:Say("Argh. Not again. This whole [" .. eq.say_link("crate") .. "] needs to be returned!");
	end
end