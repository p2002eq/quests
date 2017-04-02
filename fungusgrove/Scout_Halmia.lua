-- Scout_Halmia (######) in Fungus Grove for BST Epic

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you. but I do not have time to speak.  I am waiting on official word from Shar Vahl.  If you have been sent to assist me. please show me the war seal at this time.  If you are not such a person. please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
    
	if item_lib.check_turn_in(e.self, e.trade, {item1 = 9057}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 9062}) then -- Khati Sha Seal of War (accept either to allow redo)
		e.self:Say("I thank the spirits that you have arrived. I would not have been able to stop the dark animist if he were to attempt to leave. He has made camp in an empty set of huts. He has moved from hut to hut, but made no attempt to leave the area. I would be wary of traps if I were you. I must admit that I was afraid. That is why I moved to this location. He should still be there though.");
        spawn_draz();
		e.other:QuestReward(e.self,0,0,0,0,9062); -- used Khati Sha Seal of War
        eq.depop_with_timer();
	end
    
	item_lib.return_items(e.self, e.other, e.trade)
end

function spawn_draz()
    -- looks like he may spawn in several different locations!
    -- spawn his pet too!
end
