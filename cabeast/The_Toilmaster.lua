function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do not bother me unless you wish to join the chain gang. Now go away or I shall have my slaves chop you as they chop this granite!");
	elseif(e.message:findi("hammer")) then
		e.self:Emote("hands you a massive hammer and says, 'So, you can read. Good for you. Don't think that you're going to make an impression on me with that rubbish. Let's see if you can handle this hammer like you can that book, whelp.'");
		e.other:SummonItem(24767); -- Hammer of Exoneration
	elseif(e.message:findi("bag")) then
		e.self:Emote("turns his head to focus on you and hands you a dusty bag. He then returns to looking into the distance, just over your left shoulder.");
		e.other:SummonItem(17091); -- Penance Bag
	elseif(e.message:findi("pebbles")) then
		e.self:Say("Ah. Looking for granite pebbles, are we? You must be a Swifttail. I am tired of doing your caste's work when you give nothing in return. Tell you what, I have lost many slaves to escape. If you bash their heads in with your many skills and return at least two busted froglok shackles I will give you one pile of granite pebbles.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12660, item2 = 12660})) then -- 2x Busted Froglok Slave Shackles
		e.self:Say("A deal is a deal. Here is one pile of granite pebbles. I hope you need more because I know there are more escaped froglok slaves.");
		e.other:Faction(193,2); -- Legion of Cabilis
		e.other:Faction(30,2); -- Cabilis Residents
		e.other:Faction(282,2); -- Scaled Mystics
		e.other:Faction(62,2); -- Crusaders of Greenmist
		e.other:Faction(317,2); -- Swift Tails
		e.other:QuestReward(e.self,12,0,0,0,12689,350); -- Pile of Granite Pebbles
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18271})) then -- A Ragged Book
		e.self:Emote("looks at the tome and speaks to you, scowling, 'Very well Broodling, I have a task for you. I should make you work at the feet of my Froglok Slaves, crushing granite, but the lore of the Brood has a specific rite for this situation. Take this book and learn the will of Cazic-Thule. Read it and ask me any questions that you may have before you start your penance. It would be a shame for you to fail at this task as well... though I wouldn't mind destroying you.");
		e.other:QuestReward(e.self,0,0,0,0,18272,0); -- Rites of Exoneration
	end
	item_lib.return_items(e.self, e.other, e.trade)
end