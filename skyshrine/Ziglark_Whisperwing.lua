--Key to CS
function event_say(e)
	
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, "..e.GetName()..", I am the Herald of Lord Yelinak, the great ice dragon. I'm charged with taking care of all mundane tasks that are too trivial for the great dragon.");
	elseif(e.message:findi("i am worthy")) then
		e.self:Say("You must first prove this to me before I allow you through our home. Wenglawks of Kael is an acquaintance of ours who has been feeding us information on the storm giants' movements through Velious. Lately our couriers to him have disappeared. What you must do is take this request to him along with 200 platinum as payment for the storm giants' locations and return the information to me. After you complete this task for me, we will discuss passage through the Skyshrine");
		e.other:SummonItem(28600); --Message to Wenglawks
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28601})) then
		e.self:Say("I appear to have mistaken your declaration of worth as a phony attempt at bravado, and do apologize. You have truly proven yourself worthy of the shrine, and in short order as well. For your troubles, and as a token of your worth to the shrine, I grant you this key to traverse into the lands of the Cobalt Scar. Praise be with you and good journeys always"..e.other:GetName()..".");
		e.other:QuestReward(e.self, 0,0,0,0,28602, 500); --Shrine Key
	end
	item_lib.return_items(event.self, event.other, event.trade);	
end
				
