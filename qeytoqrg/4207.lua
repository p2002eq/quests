local drink = 0;
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you aren't going to buy me a [" .. eq.say_link("drink") .. "] than get lost");
	elseif(e.message:findi("drink")) then
		e.self:Say("Tumpy Tonic, of course. The brewry shut down last year....can you find me a few cases?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114,item3 = 12114,item4 = 12114})) then -- Green Goblin Skin
		drink = drink + 4;
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
	end
	if(drink > 100) then
		eq.unique_spawn(4211,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ());
		e.other:QuestReward(e.self,0,0,0,0,0,17800);
		drink = 0;
		eq.depop();
	end

	item_lib.return_items(e.self, e.other, e.trade)
end