function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend. If fine weapons are what you seek then you shall find them here in my shop. I have traveled far and wide for the finest weapons. Still, there are a few [unusual weapons] which have eluded me.");
	elseif(e.message:findi("unusual weapons")) then
		e.self:Say("Unusual weapons? Yes. There are a few which I sought. Such an item is the [brazen brass kilij].");
	elseif(e.message:findi("brazen brass kilij")) then
		e.self:Say("The brazen brass kilij is a legendary magical weapon designed by the ancients and long lost to the winds of time. I have searched the world for it to no avail. Perhaps the [legend of Husam] will add some insight to my quest. I have some knowledge of its design and I am sure I can [craft the kilij].");
	elseif(e.message:findi("legend of husam")) then
		e.self:Say("Legend says the kilij was forged for a great paladin for his assault on the land of the dead. He was to slay the evil siblings Dimetreas and Byzola. It is said he killed Byzola. With the kilij he was unstoppable. Dimetreas knew this and cast an [evil spell] upon the kilij.");
	elseif(e.message:findi("evil spell")) then
		e.self:Say("The enchantment would allow only rogues, warriors and the feeble minstrels to wield it. And so Dimetreas defeated the now unarmed paladin and shattered the kilij. He then found the only kilij plans and sent them to the Plane of Man to be held forever by his evil servant, Husam.. Husam of the burning sun.");
	elseif(e.message:findi("craft the kilij")) then
		e.self:Say("I can craft the kilij. All I need are the kilij plans and three enchanted gold bars. The blend of metals is not entirely brass and only an enchanter can provide the enchanted metal I need. As for the plans, perhaps during your great adventures you shall happen upon it. If so, I can make one for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12206,item2 = 16506,item3 = 16506,item4 = 16506})) then
		e.self:Say("You have succeeded in your quest for the kilij!! Wield it proudly.");
		e.other:SummonItem(5366);
		e.other:Ding();
		e.other:Faction(174,10); -- kelethin merchants
		e.other:Faction(99,1); -- faydark's champions
		e.other:Faction(92,1); -- emerald warriors
		e.other:Faction(8,1); -- anti-mage
		e.other:AddEXP(1500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end