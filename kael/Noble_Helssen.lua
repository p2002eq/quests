function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("You obviously have no idea where you have trespassed so I will generously allow you to live. I suggest you leave immediately before my generosity runs out however......Unless, you're looking for work.");
	elseif (e.message:findi("looking for work")) then	
		e.self:Say("Well, you might do. Out in the deepest scar, known as the Wakening Land we have deployed several mercenaries to harass the local annoying population. They are in need of constant supplies so we hire those we can trust to deliver those supplies to the mercenaries wandering out in the field. Are you interested, "..e.other:Race().."?");
	elseif (e.message:findi("i am interested")) then	
		e.self:Say("Very well. Take this pack of supplies to any of the Mercenaries you come across in the field. They will pay you upon delivery. Return here for more supplies to deliver when you are ready.");
		e.other:SummonItem(1724);
	elseif (e.message:findi("plane of growth")) then
		e.self:Say("Our soldiers fell victim to the denizens of that plane and unless we can find some way to stop this from happening, the land of Wakening will never be under our control. Many have suggested just destroying the Nexus but they are short-sighted fools. My vision is not only to control the resources that forest provides, but also to control the very force of Growth itself! You will help me to do this, mercenary.");
	elseif (e.message:findi("how will I help you")) then	
		e.self:Say("The tablet I have given you is inscribed with runes of binding. I am owed a favor and it has come time to use it. There is a venerable sea turtle that lives along the warmer part of the coast, where the ice floes begin to break up. His name is Corudoth. Find him and speak with him. Remind him of his obligation to me and if he is not forthcoming in his answers, tell him he owes me. Then show him the tablet. He will tell you what to do. He will most likely be beneath the ocean.  The mask I gave you should help.");
		e.other:SummonItem(1713); --Enchanted Velium Mask
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1709})) then
		e.self:Emote("takes the report from you and places it in a pocket without even glancing at it. He says, 'Do not worry, "..e.other:GetName()..". I know of the planar creatures who eliminated my troops. The fault is not yours but of that fool Drioc's. The Savage land is not just a simple forest as those idiots in the field believe. It is a cradle of life and the forces that drive it. Within that forest is a nexus, a gateway to another plane of existence, the Plane of Growth.'");
		e.other:QuestReward(e.self, 0,0,0,0, 1710, 1000);
		e.other:Faction(189, 10); --kromrif
		e.other:Faction(188, 10); --kromzek
		e.other:Faction(179, 10); --KT
		e.other:Faction(42, -30); --CoV
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  1712, item2 = 1714})) then	
		e.other:QuestReward(e.self, 0,0,0,0, 1720, 2000);
		e.other:SummonItem(1723);
	end	
	item_lib.return_items(e.self, e.other, e.trade);	
	
end
