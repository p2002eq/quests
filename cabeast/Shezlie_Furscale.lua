function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Be careful around here. " .. e.other:GetName() .. ". Injured broodlings are no use to anyone. Many of these structures are yet unstable and could fall at any time. If you're a mystic, I can teach you how to [" .. eq.say_link("protect") .. "] yourself.");
	elseif(e.message:findi("protect")) then
		e.self:Say("Yes indeed. As a broodling, you will need some protection to avoid any... unfortunate accidents. Should you wish, I can fashion some [" .. eq.say_link("armor") .. "] for you from some basic components. Provided you risk your life gathering them for me first.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Armor, indeed. I can fashion protection for your [" .. eq.say_link("chest") .. "], [" .. eq.say_link("hands") .. "], [" .. eq.say_link("legs") .. "], or [" .. eq.say_link("head") .. "].");
	elseif(e.message:findi("chest")) then
		e.self:Say("To make a breastplate for you, you will have to bring me some banded mail, a star ruby, some watchman's spectacles, and some nectar of isolation. Now hurry back.");
	elseif(e.message:findi("hands")) then
		e.self:Say("For gauntlets, I will need some banded gauntlets, a ruby, some venomous parchment, and a warlord drawing pen.");
	elseif(e.message:findi("legs")) then
		e.self:Say("If you want to protect your legs with some greaves, then bring me some banded leggings, a fire emerald, a sarnak recruitment letter, and an exiled iksar head.");
	elseif(e.message:findi("head")) then
		e.self:Say("For a helment, bring me a banded helm, a sapphire, Bargynn's Digger, and Sythrax building plans.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3056, item2 = 10032, item3 = 14777, item4 = 14778})) then -- Banded Mail, Star Ruby, Watchmans Spectacles and Nectar of Isolation
		e.self:Say("Ah. Very good. Take this breastplate for your own good.");
		e.other:Faction(282,10); -- Scaled Mystics
		e.other:Faction(193,5); -- Legion of Cabilis
		e.other:Faction(30,5); -- Cabilis Residents
		e.other:QuestReward(e.self,0,0,0,0,4989,2000); -- Scaled Mystic Breastplate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3062, item2 = 10035, item3 = 14773, item4 = 14774})) then -- Banded Gauntlets, Ruby, Venomous Parchment and Warlord Drawing Pen
		e.self:Say("Hmmm? Oh. Your gauntlets. Yes. Here you are. Now be careful.");
		e.other:Faction(282,10); -- Scaled Mystics
		e.other:Faction(193,5); -- Legion of Cabilis
		e.other:Faction(30,5); -- Cabilis Residents
		e.other:QuestReward(e.self,0,0,0,0,4985,1000); -- Scaled Mystic Gauntlets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3063, item2 = 10033, item3 = 14775, item4 = 14776})) then -- Banded Leggings, Fire Emerald, Sarnak Recruitment Letter and Exiled Iksar Head
		e.self:Say("Ahhh yes. These will protect your legs from the threat of tables.");
		e.other:Faction(282,10); -- Scaled Mystics
		e.other:Faction(193,5); -- Legion of Cabilis
		e.other:Faction(30,5); -- Cabilis Residents
		e.other:QuestReward(e.self,0,0,0,0,4987,1000); -- Scaled Mystic Greaves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3053, item2 = 10034, item3 = 14771, item4 = 14772})) then -- Banded Helm, Sapphire, Bargynns Digger and Sythrax Building Plans
		e.self:Say("Take this helment and keep your head down when you leave. The door is a little low.");
		e.other:Faction(282,10); -- Scaled Mystics
		e.other:Faction(193,5); -- Legion of Cabilis
		e.other:Faction(30,5); -- Cabilis Residents
		e.other:QuestReward(e.self,0,0,0,0,4990,1000); -- Scaled Mystic Helm
	end
	item_lib.return_items(e.self, e.other, e.trade)
end