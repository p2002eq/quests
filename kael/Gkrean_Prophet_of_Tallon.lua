function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You have entered the sacred temple of Tallon Zek. This is the Temple of Tactics, where we teach what must be done to achieve goals in the most efficient manner.");
	elseif(e.message:findi("teach me")) then	
		e.self:Say("I cannot teach one of your kind the arts of war. I must teach the other Kromzek at this time. If you were to serve the Temple of Tactics I might consider giving you a few words of wisdom.");
	elseif(e.message:findi("serve the temple")) then
		e.self:Say("The great father of war, Rallos Zek, wishes the destruction of the inferior race known as the Coldain. As the high priest of Tallon Zek, I see that they use great tactics to evade destruction. Find the ones who teach these tactics to the other Coldain and bring back the books that contain the ancient Coldain tactics and strategies. Do not waste my time without a scroll or book that those tiny beasts hold");
	end
end

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24987})) then
		e.self:Say("You are a brave little beast to gain this tome. Let me impart a bit of wisdom to you. Tactics must change - if you do not ever adapt to new surroundings, environments and rules, you will surely perish.");
		e.other:Faction(188, 30); --kromrif
		e.other:Faction(189, 30); --kromzek
		e.other:Faction(179, 30); --king tormax
		e.other:Faction(42, -90); --CoV
		e.other:QuestReward(e.self, 0,0,0,0,eq.ChooseRandom(25037,25038,25039,25042), 50000);
	end

	item_lib.return_items(e.self, e.other, e.trade)	
end
