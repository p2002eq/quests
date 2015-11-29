local drink = 0;
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Huh....whadjuu saaaaay? I need some more [tonic]");
	elseif(e.message:findi("tonic")) then
		e.self:Say("Tumpy Tonic, you wanker");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114,item3 = 12114,item4 = 12114})) then -- Green Goblin Skin
		drink = drink + 4;
-- <<<<<<< HEAD Not sure what this is commenting out
		e.self:Emote("chugs the entire bottle");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114,item3 = 12114})) then -- Green Goblin Skin
		drink = drink + 3;
		e.self:Emote("chugs the entire bottle");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114})) then -- Green Goblin Skin
		drink = drink + 2;
		e.self:Emote("chugs the entire bottle");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114})) then -- Green Goblin Skin
		drink = drink + 1;
		e.self:Emote("chugs the entire bottle");
-- ======= Not sure what this is comnenting out
		e.self:Say("Cheers, keep em coming");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114,item3 = 12114})) then -- Green Goblin Skin
		drink = drink + 3;
		e.self:Say("Cheers, keep em coming");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114})) then -- Green Goblin Skin
		drink = drink + 2;
		e.self:Say("Cheers, keep em coming");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114})) then -- Green Goblin Skin
		drink = drink + 1;
		e.self:Say("Cheers, keep em coming");
-- >>>>>>> 4418d31ae979dca5d9952dbeb21eb8e4199f743b Not sure what this is commenting out
	end
	if(drink > 100) then
		eq.unique_spawn(4213,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ());
		e.other:QuestReward(e.self,0,0,0,0,0,17800);
		drink = 0;
		eq.depop();
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
