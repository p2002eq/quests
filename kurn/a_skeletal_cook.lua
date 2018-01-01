function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Some cracked old bones, two zombie flesh, and a salt minnow make up the rest. Throw inside a skull and mix, and I would have a delightful dish. But with no eyes I have no sight to make Kurn's delicious delight. And if I could I would not eat without a tongue behind my teeth.");
	end
end

function event_trade(e)
	local item_lib = require("items"); --Handin: a Glowing Skull
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12401})) then
		e.other:Message(7,"The cook's bones crack as he reaches out to take the skull from your hands. A voice in your mind says, 'Thank you. Now I can leave this dreadful place. Please take this as I no longer have any use for it.' The cook places the skull back in your hands before collapsing into a lifeless pile of bones.");
		e.other:QuestReward(e.other,0,0,0,0,1115,2000); --Summon: The Skull of Torture
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end