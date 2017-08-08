function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am the operator of this scrapyard. If you have any scrap metal, I would be glad to purchase it from you in loads of four. The Gemchoppers no longer allow me to accept blackbox fragments and micro servos.");
	elseif(e.message:findi("princess joleena")) then
		e.self:Say("No!! You cannot have my magic Fairie Wing!! I need it. I read somewhere within the great library that the magic wing from a fairie princess will restore my full head of hair. Look at me!! I am bald!! I have no [" .. eq.say_link("friends") .. "] at all.");
	elseif(e.message:findi("friends")) then
		e.self:Say("Oh. You are just saying that so you can get my fairie wing. I will make you a deal. I cannot rely on this wing forever. I will trade it with you if you could get me a case of hair tonic. If you are a true friend you [" .. eq.say_link("will fetch the hair tonic") .. "] for me.");
	elseif(e.message:findi("hair tonic")) then
		e.self:Say("Great!! Here you go, my friend. Take this crate and within you shall fill each slot with hair tonic. When all are combined within the crate, return it to me for your wing. I am not sure what the tonic was or where I got it. There is some writing on the crate, but I could not identify it.");
		e.other:SummonItem(17979); -- Crate for Tonics
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13198, item2 = 13198, item3 = 13198, item4 = 13198})) then -- 4x Scrap Metal
		e.self:Say("For your efforts I shall reward you");
		e.other:Faction(115,3,0); -- Gem Choppers
		e.other:Faction(176,3,0); -- King Ak'Anon
		e.other:Faction(210,3,0); -- Merchants of Ak'Anon
		e.other:Faction(71,-3,0); -- Dark Reflection
		e.other:Faction(39,-3,0); -- Clan Grikbar
		e.other:QuestReward(e.self,4,5,1,1,eq.ChooseRandom(5013,5013,5013,5014,5014,5014,5015,5015,5015,5016,5016,5016,5019,5019,5019,5020,5020,5020,12340,12340,17033),100); -- rusty weapons, Orb o flight and a contraption
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9426, item2 = 28618, item3 = 29906, item4 = 28165})) then -- Bundle of Super Conductive Wires, Gold Tipped Boar Horn, Shard of Pure Energy and Silicorrosive Grease
		e.self:Say("I've been waiting for those.  Thank you, please take this!");
		e.other:QuestReward(e.self,0,0,0,0,15980,100); -- Note for Fimli
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12336})) then -- A Crate of Tonic
		e.self:Say("Huzzah!! You are my friend. Now you can take my old toupee and get it repaired. Just go to Freeport and ask Ping to [repair the toupee]. Hey!! You know what? He is the guy who sells the hair tonic!! I remember now. Well,.. Get my toupee repaired and I will give you the fairie wing.");
		e.other:QuestReward(e.self,0,0,0,0,12337,100); -- A Tattered Toupee
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12254})) then -- Mane Attraction
		e.self:Say("Double Huzzah!! You are a good friend " .. e.other:GetName() .. ". Now mayhaps I shall find myself a wife. Here pal, the fairy wing. I hope it can give you a great head of hair. You need it.");
		e.other:QuestReward(e.self,0,0,0,0,12339,100); -- A Glimmering Fairie Wing
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13216, item2 = 13217})) then
		e.self:Say("Good. The citizens of Ak'Anon are safe from those little critters. They may have injured someone; that is why they are deactivated. Here is something I found in the scrapyard. I hope you can find a purpose for it.");
		e.other:Faction(115,10,0); -- Gem Choppers
		e.other:Faction(176,2,0); -- King Ak'Anon
		e.other:Faction(210,2,0); -- Merchants of Ak'Anon
		e.other:Faction(71,-2,0); -- Dark Reflection
		e.other:Faction(39,-2,0); -- Clan Grikbar
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(5),0,eq.ChooseRandom(17981, 17981, 6027),250); -- Bootstrutter's Framed Pack (66.6%) or Forging Hammer (33.3%)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end