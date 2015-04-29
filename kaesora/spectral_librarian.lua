-- Ink of the dark - enchanter epic lead in quest

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10631})) then
		e.self:Say("You have no idea what it is like to be trapped in this place. Take your precious little stone and leave this place.");
		e.other:QuestReward(e.self,0,0,0,0,10618,10000);
		--e.other:Ding();
		eq.spawn2(88087,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
