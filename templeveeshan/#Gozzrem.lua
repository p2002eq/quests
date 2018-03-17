-- Gozzrem's WToV tests: 1st & 2nd arcane tests, wisdom long and short battles

function event_say(e)
	if e.other:GetFaction(e.self) == 1 then  -- req ally CoV
		if e.message:findi("hail") then
			e.self:Say(string.format("Greetings, %s. If you seek [" .. eq.say_link("wisdom") .. "] or the [" .. eq.say_link("arcane") .. "] I have tasks in the halls of testing you may complete to gain what you seek.", e.other:GetCleanName()));
		elseif e.message:findi("arcane") then
			e.self:Say("To garner a reward fit for one who walks the arcane path return to me the poison tear and the poison symbol. Along with these return the serrated symbol and the runed symbol. If this task is not hard enough for you, I have a [" .. eq.say_link("second quest") .. "] for you.");
		elseif e.message:findi("second quest") then
			e.self:Say("Tears may fall to the ground but not the ones you seek now. The black tear and the ruby tear you must seek. For more power I require the ruby symbol and a white symbol to bind the powers together. Upon the return of these four objects you will receive a wondrous reward.");
		elseif e.message:findi("wisdom") then
			e.self:Say(string.format("Wisdom can be gleaned from battle and that is what I wish you to do. Battle in the halls of testing may give you a different outlook on life. Which do you seek, the [" .. eq.say_link("short battle") .. "] or the [" .. eq.say_link("long battle",false,"long") .. "] %s?", e.other:GetCleanName()));
		elseif e.message:findi("long battle") then
			e.self:Say("You will spend much time in the halls of testing. Seek out a runed tear and a flame kissed tear, bring them back to me with a symbol black as midnight and a glowing orb of the ancient drakes.");
		elseif e.message:findi("short battle") then
			e.self:Say("For the shortest time in the halls, seek out a Platinum tear held by the cursed one, a platinum symbol, a silver symbol and an emerald symbol as green as the forests. If you are able to return these to me I will reward you with a simple idol of the white dragons.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) <= 1) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31266, item2 = 31255, item3 = 31252, item4 = 31254})) then
			give_reward(e.self, e.other, 31466);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31262, item2 = 31270, item3 = 31259, item4 = 31250})) then
			give_reward(e.self, e.other, 31468);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31267, item2 = 31263, item3 = 31251, item4 = 31260})) then
			give_reward(e.self, e.other, 31467);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31253, item2 = 31258, item3 = 31257, item4 = 31269})) then
			give_reward(e.self, e.other, 31465);
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such an item, yet.");
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

function give_reward(self, other, item)
	self:Emote("looks pleased as she hands you the reward.");
	other:Faction(42,50); -- CoV
	other:Faction(362,25); -- Yeli
	other:Faction(189,-100); -- Kromzek
	other:QuestReward(self,0,0,0,0,item,200000);
end
