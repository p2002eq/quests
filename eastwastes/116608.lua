-- Corbin Blackwell. This is currently the version that spawns in the wild
function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Hurry! There's not much time. give me the key and show me proof that you are a friend sent to rescue me...");
	end
end

function event_trade(e)
    local item_lib = require('items');
    if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1046, item2 = 30162})) then -- Shackle Key and Mithril Coldain Insignia Ring
        e.other:QuestReward(e.self,0,0,0,0,30162,1000); -- Mithril Coldain Insignia Ring
        eq.depop_with_timer();
        eq.spawn2(116119, 0,0,86,216,32,381.4); -- Corbin Blackwell
    end
	item_lib.return_items(e.self, e.other, e.trade);
end
