function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, you have made excellent time. We received word that Zordak was gathering his power here, and we still have little knowledge of his true intentions. Scattered throughout these mountains there are small Pearlescent Shards, binding four of these shards together within a Box of Binding should allow me to create a Seal. This seal, when fused with a Swirling Pearl inside Zordak's heart should allow our seers to divine his true intentions, even after he has been slain. Once you have the seal I will release Zordak, make haste I will not be able to hold him for long.");

	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24996})) then
	e.self:Say("The Triumvirate thinks that destroying my spirit of flame will stop me?!! I will kill you all now, the goblins will continue to war, and when my spirit is restored I will ensure that Ixiblat Fer consumes all of Norrath in his flames!!");
		eq.unique_spawn(91096,0,0,-3225,3011,-149);
		e.other:QuestReward(e.self,0,0,0,0,24997,100000);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--- Written by Fiddlemetimbers