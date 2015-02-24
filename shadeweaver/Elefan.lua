local research;
function event_spawn(e)
	research = 0;
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". It's a pleasure to meet you as I do not see many visitors while I am working in the field gathering research.");
	elseif(e.message:findi("research") and research == 1) then
		e.self:Say("Oh I have some different berries and antidote ingredients that I gathered not too long ago. I would imagine these are what he needs. Will you [take the Antidote ingredients] to Zimloro?");
	elseif(e.message:findi("take the antidote ingredients") and research == 1) then
		e.self:Say("Here you are, " .. e.other:GetName() .. ". Please bring them to him at once so they do not spoil and thank you for your help.");
		research = 0;
		e.other:SummonItem(4759);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 4758})) then
		e.self:Say("Ah I see you are sent from master Zimloro eh, " .. e.other:GetName() .. ". This note reads that he needs some specific items at once. Perhaps he could find some use out of all of this research I have recently collected.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
