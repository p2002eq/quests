function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("angrily rattles his shackles. 'Damned Kobolds!! Some day I will return and these filthy warrens will be littered with their dog faced corpses! You wouldn't happen to have a key for these shackles would you?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 6923})) then
		e.self:Say("I say we round up the Furballs AND the Dog Faces and let them kill each other off! Then we can easily finish off the survivors!");
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone: warrens ID:101068 -- an_erudite_prisoner