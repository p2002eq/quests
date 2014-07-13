function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Gloop.. Are you the one? Who sent you?");
	end
	if(e.message:findi("the greenblood shaman sent me")) then
		e.self:Say("Gloop.. Good. I am the secret emissary of the frogloks of Guk. I have come to help your community, provided, that is, that you help mine. Gloop.. I want you to track down and kill the troll hunters called 'slayers.' They are capturing our foragers in the swamps. Return their slayer necklaces to me and I shall pay you, but most important, find the slayer captain. Bring me his captain's necklace and I shall give you a secret. I must leave soon. If you need me, just ask Marda where I am.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13369})) then
		e.self:Say("Good work. That is one less troll slayer. My people shall learn of your good deed. Please search for the slayer captain. He must be stopped.");
		e.other:Faction(233,20);
		e.other:AddEXP(200);
		e.other:GiveCash(0,0,7,5);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13370})) then
		e.self:Say("'Oooh!! .. You have dispatched the slayer captain. It will take them time to reorganize the slayers. During this time the froglok foragers can gather more provisions for Guk. Please take this as a token of my people's appreciation. Your standing with my brethren has grown. As for Marda's information.. within Grobb lies my aide, Groak. He was captured. Tell him Glib sent you.");
		e.other:Faction(233,20);
		e.other:AddEXP(200);
		e.other:GiveCash(0,0,1,0);
		e.other:SummonItem(eq.ChooseRandom(17928,13371));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
