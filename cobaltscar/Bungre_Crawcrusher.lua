function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What manner of creature are you, strange one? I can see that you are not native to any nearby territories. Your thin flesh and lack of hair would mean certain death when the ice queen breathes upon these seas.");
	elseif(e.message:findi("..e.other:Race()..")) then	
		e.self:Say("I have heard not of your kind but you are welcome to take refuge on our beaches, we only ask that you help to defend them should the predators choose to attack.");
	elseif(e.message:findi("predators")) then
		e.self:Say("There are many dangerous predators that prowl the surrounding oceans and cliffs. It is my duty to train pups to become strong warriors in order to defend our villages. The wyverns on the cliffs prey primarily on the wounded and sick as well as many creatures that live in the brackish waters of our bay. The deadliest predators are the ones that roam all the coasts preying not only on my people but the Snowfangs and the Ulthork as well. Kelorek'Dar and Lodizal are the most feared of all.");
	elseif(e.message:findi("lodizal")) then
		e.self:Say("Lodizal is a giant carnivorous sea turtle that roams the iceclad ocean preying primarily on the Snowfang gnolls. The Snowfang gnolls are not trusted by we Othmir as they survive on the skins and meat of walrus and otter but Lodizal is a threat to all coastal dwellers. Should Lodizal ever be slain I would be willing to craft a shield from his shell and adorn it with Othmir runes. I would charge ten thousand gold for the service.");
	end
end

function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22815, platinum = 1000})) then -- Section of Lodizal's Shell and 1000 Platinum
		e.self:Emote("skillfully crafts the section of Lodizal's shell into the shape of a shield. He then attaches sturdy cured walrus hide leather straps to the inner side of the shield and inscribes intricate glowing runes on the shield's face. When he is finished, he hands you the shield and claps loudly.");
		e.other:Faction(241, 30); -- Othmir
		e.other:Faction(345, -60); -- Ulthork
		e.other:QuestReward(e.self,0,0,0,0,22816,100000); -- Lodizal Shell Shield
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22815, platinum ~= 1000})) then -- Section of Lodizal's Shell and less than 1000 Platinum
		e.self:Say("Sorry stranger, but that is not enough to barter with.");
		item_lib.return_items(e.self, e.other, e.trade);
	end
	item_lib.return_items(e.self, e.other, e.trade)	
end
