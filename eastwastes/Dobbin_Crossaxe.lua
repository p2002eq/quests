local ring_seven_final = 0;

function event_signal(e)
    e.self:Say("signal");
	if (e.signal == 1) then
		ring_seven_final = 1;	
		e.self:Say("We thought it was too late, the Dain will be very pleased!");
		e.self:Say("Please friend, show me your Mithril ring and I will show you our gratitude.");
	elseif (e.signal == 2) then
		ring_seven_final = nil;
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30162})) and (ring_seven_final == 1) then
		e.self:Say("Thank you. " .. e.other:GetName().. ", your deeds will be mentioned to  the Dain. Please take this note from Corbin to Garadain. it may help him to achieve victory over the enemy.");
		ring_seven_final = nil;
		e.other:QuestReward(e.self,0,0,0,0,1047,10000);
		e.other:Faction(49, 5);
		e.other:Faction(67, 5);
		e.other:Faction(188, -10);
		e.other:Faction(189, -10);
		eq.depop_all(116119);
	end
end
