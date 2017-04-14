-- Scout_Sihmoj (96377) in Timorous Deep for BST epic

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend, please show me the Seal of Elder Dumul and I will brief you on the situation.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9045})) then -- Seal of Elder Dumul
		e.self:Say("Good to see you, now keep your head down friend. He may look out here at any moment, though he's been asleep most of the day. He's been staying in a ruined building on that island over there. I'm sure you can see it from here. You should be able to surprise him with little trouble. Just take care to avoid any traps he may have set. He's proven to be a very capable magic-user.");
		e.self:Say("When you finish with him, please bring any evidence of his being dispatched back to me in this bag. I'll direct you from there. Good luck... I'll watch from here.");
		e.other:QuestReward(e.self,0,0,0,0,17360); -- Black Silk Sack
		eq.unique_spawn(96387,0,0,1988,-9203,10,25); -- Draz Nurakk (trigger)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9047})) then -- Sack of Broken Glass
		e.self:Say("I knew that this creature had power, but how do you explain this? That fight was well beyond my comprehension. I'm not sure what to do other than have you return the bag to Elder Dumul. I'm sure that he will know what to do next. Take care and be swift.");
		e.other:QuestReward(e.self,0,0,0,0,9048); -- Sack of Broken Glass (approved version)
		eq.depop_with_timer();
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

