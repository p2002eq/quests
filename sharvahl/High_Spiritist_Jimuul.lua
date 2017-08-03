function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I need to update our king on the progress of your attempts to acquire the mines. What should I tell him?");
	elseif(e.signal == 2) then
		e.self:Say("I understand the condition of the areas that you mentioned. My question  was related to the mines. In what state are our efforts to control the acrylia mines? I need accurate information on our progress in that area!");
	elseif(e.signal == 3) then
		e.self:Say("I cannot speak on that matter at this time.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
