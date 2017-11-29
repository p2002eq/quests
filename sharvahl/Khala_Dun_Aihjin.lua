-- Quest for luclin smithing
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there. " .. e.other:GetName() .. ".  Careful around some of the rougher pubs late at night. wouldn't want to see you caught up in a fight like the last one I broke up.  Did you hear about it?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29803})) then -- A Shield Repair Order
		e.self:Say("My shield, huh? I guess it is dented up pretty good from that last fight I broke up. Want to hear about it?");
		e.other:QuestReward(e.self,0,0,0,0,29810); -- Aihjins Dented Shield
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29811})) then -- Aihjins Immaculate Shield
		e.self:Say("Well done, I sure will be ready for next time something tries to cause a disturbance in our city. My thanks to you " .. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,29812); -- Aihjins work order
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
