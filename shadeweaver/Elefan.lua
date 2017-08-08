---- Quest:Zimloro's Potion Quest
local research;
function event_spawn(e)
	research = 0;
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". It's a pleasure to meet you as I do not see many visitors while I am working in the field gathering research.");
	elseif(e.message:findi("samples") and research == 1) then
		e.self:Say("Oh, some antidote ingredients that I stumbled upon not long ago. They should meet his needs. Will you be so kind as to [" .. eq.say_link("take the antidote ingredients") .. "] to Zimloro?");
	elseif(e.message:findi("ingredients") and research == 1) then
		e.self:Say("Here you are, " .. e.other:GetName() .. ". Please bring them to him at once so they do not spoil and thank you for your help.");
		research = 0;
		e.other:QuestReward(e.self,0,0,0,0,4759,5000); -- Antidote Ingredients
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4758})) then -- Zimloro Ingredient List
		e.self:Say("Ah! Master Zimloro sent you, eh? This note indicates that he wants some specific ingredients. Luckily, I've got several [" .. eq.say_link("fresh samples") .. "] that I've only recently collected.");
		research = 1;
		e.other:QuestReward(e.self,0,0,0,0,0,1000); -- Exp
	end
	item_lib.return_items(e.self, e.other, e.trade)
end