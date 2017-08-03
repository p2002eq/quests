function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13894})) then
		e.self:Say("Aye.. You cut out the middleman..  I shall reward you.. hmm..  I have not found anything. how about..  <CRACK!! SNAP!! RIPP!!>  How about something off meself?");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9304,12195,13073,13074),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end