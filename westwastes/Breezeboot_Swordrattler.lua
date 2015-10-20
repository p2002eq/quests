-- 



function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Arr! Well. blow me down and hoist me mizzenmast! Swab the fo'c'sle and kick the bosun! Arrgh. To the four winds with this! I am cold, wet, hungry, shipwrecked, and bloody tired of playing at being a pirate. Breezeboot is not really my name, but it will do for now. I do not know how you got here, but you give me hope of escaping this frozen hell. We have been shipwrecked here for weeks now, though that is a long story.");
	elseif(e.message:findi("long story")) then
		e.self:Say("We were trying to make a good coastal map of Velious, you understand, and to do that, we needed to circumnavigate the continent. Figured we might find some treasure too. It was not an easy trip, but the boys I brought along are pretty good sailors, and they all know their business, unlike that group of pretend pirates back at the Iceclad landing. We were doing fine until a storm blew up, and ran us right into these rocks. Our port screw, or was that starboard, anyway, the one on the left, broke on the bottom, and we started shipping water, floodiing the boiler. There is no way we can repair the damage. So here we are - stuck!");
	elseif(e.message:findi("help")) then
		e.self:Say("Well, we will need lumber - a good bit of it. I saw some likely wrecks when we sailed up the Cobalt Scar, you might want to look there. We also need rope, a lot of it, to lash the logs together, at least one hundred feet. Finally, we need something we can use as a sail - I do not like the idea of trying to paddle all the way back. I am not sure what you can find for that, but it needs to be strong, light, and not pass much air. Gather all that up, and come see me. I think I might have a bit of plunder and booty I can part with, in payment.");
	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27264,item2 = 27263,item3 = 27262})) then
		e.other:QuestReward(e.self,0,0,0,0,27310,60000);
	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end