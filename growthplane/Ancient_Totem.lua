function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, my friend. It is not often that we see strangers coming to this plane. I fear that our growing infestation problem has kept us busy as of late. The time for battle grows near yet we still do not have the offensive magics necessary to fend off our enemies.");
	elseif(e.message:findi("magic")) then
		e.self:Say("There are legends describing scrolls of ultimate power and enlightenment from fallen channelers that preserver the knowledge necessary for us to overcome our plight. Since these are just legends I cannot assure you that these scrolls exist, but at this point they are our only hope.");
    elseif(e.message:findi("scrolls")) then
		e.self:Say("The ancient scrolls needed to complete the Tome that will aid us are found in Dragon Necropolis if the legends are true. The tome itself was made up of the incantations and the teachings of the great Lel`Farthok who was a mighty channeler for his time.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28032, item2 = 28009, item3 = 28006, item4 = 28033})) then
		e.self:Say("Thank you, friend.  These scrolls will serve us well in the future.  Please take this as a sign of my gratitude.");
		e.other:QuestReward(e.self,0,0,0,0,1324,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end