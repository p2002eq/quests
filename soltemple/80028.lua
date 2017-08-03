-- Cleric epic - a_seeker in soltemple

function event_say(e)
	if(e.message:findi("solusek ro")) then
		e.self:Say("Solusek Ro is the Master of Fire and the Keeper of Power.");
	elseif(e.message:findi("plasmatic priest")) then
		e.self:Say("You speak of things that should not be spoken! It would be in your best interest to leave this temple at once and return to lands less consumed by flame!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28051})) then
	e.self:Say("The Triumvirate thinks that destroying my spirit of flame will stop me?!! I will kill you all now, the goblins will continue to war, and when my spirit is restored I will ensure that Ixiblat Fer consumes all of Norrath in his flames!!");
		local new_npc = eq.unique_spawn(80042,0,0,39,328,28.7);
		new_npc:AddToHateList(e.other, 1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
