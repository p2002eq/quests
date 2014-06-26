--The Toilmaster is part of The Penance quest, which is for any iksar who has lost the item they received from turning in their newbie note. He is also used for the Granite Pebbles quest.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do not bother me unless you wish to join the chain gang. Now go away or I shall have my slaves chop you as they chop this granite!");
	elseif(e.message:findi("hammer")) then 	--The Penance quest
		e.self:Emote("hands you a massive hammer and says, 'So, you can read. Good for you. Don't think that you're going to make an impression on me with that rubbish. Let's see if you can handle this hammer like you can that book, whelp.'");
		e.other:SummonItem(24767);
	elseif(e.message:findi("bag")) then 					--The Penance quest
		e.self:Emote("turns his head to focus on you and hands you a dusty bag. He then returns to looking into the distance, just over your left shoulder.");
		e.other:SummonItem(17091);
	elseif(e.message:findi("pebbles")) then 		--Granite Pebbles quest
		e.self:Say("Ah. Looking for granite pebbles, are we? You must be a Swifttail. I am tired of doing your caste's work when you give nothing in return. Tell you what, I have lost many slaves to escape. If you bash their heads in with your many skills and return at least two busted froglok shackles I will give you one pile of granite pebbles.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12660, item2 = 12660})) then
		e.self:Say("A deal is a deal. Here is one pile of granite pebbles. I hope you need more because I know there are more escaped froglok slaves.");
		e.other:SummonItem(12689);
		e.other:Faction(193,2);
		e.other:Faction(30,2);
		e.other:Faction(282,2);
		e.other:Faction(62,2);
		e.other:Faction(317,2);
		e.other:AddEXP(350);
		e.other:GiveCash(12,0,0,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18271})) then --The Penance quest
		e.self:Emote("looks at the tome and speaks to you, scowling, 'Very well Broodling, I have a task for you. I should make you work at the feet of my Froglok Slaves, crushing granite, but the lore of the Brood has a specific rite for this situation. Take this book and learn the will of Cazic-Thule. Read it and ask me any questions that you may have before you start your penance. It would be a shame for you to fail at this task as well... though I wouldn't mind destroying you.");
		e.other:SummonItem(18272);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--The Penance quest submitted by Jim Mills. Granite Pebbles quest submitted by cavedude.
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
