function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations! The Song Weavers are always glad to add a new voice to the choir.  In addition to your voice. will you also [fetch spiderling silk]?  We need some to replace our worn lute strings.  Carry out this task in high tempo and we will show our gratitude.");
	elseif(e.message:findi("spiderling silk")) then
		e.self:Say("Very spirited of you!!  Gather four spiderling silk and return them to me.  Good hunting. my friend!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18783})) then -- Tattered Note
		e.self:Say("Greetings. friend. I am Sylia.  I see that you wish to join our humble guild.  Good.  Here is a gift for you - your guild tunic.  Let's get started with your training, shall we?");
		e.other:Faction(306,100); -- Song Weavers
		e.other:QuestReward(e.self,0,0,0,0,13534,100); -- Faded Brown Tunic
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13099,item2 = 13099,item3 = 13099,item4 = 13099})) then
		e.self:Say("Splendid job! Now if you can just keep a tune, you'll be a fine bard.");
		e.other:Faction(306,5); -- Song Weavers
		e.other:QuestReward(e.self,0,0,math.random(5),0,13000,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54088 -- Sylia_Windlehands