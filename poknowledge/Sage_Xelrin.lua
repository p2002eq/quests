function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ".  I assume you are here to ask about my research?  I imagine that word has spread of my groundbreaking approach to spell creation.  Well I am always willing to enlighten those that choose to learn.  As not to bog you down with too many details. my theory is simple. [Continue]");
	elseif(e.message:findi("continue")) then
		e.self:Say("Well the idea is rather basic.  As I am sure you know. there are many magical artifacts in the world with effects that we have not mastered.  It is my conjecture that some of the magic may be extracted from these items in order to further our magical repertoire.  Even in the case where an object has a spell that we already have access to. I believe the binding used to tie the magic to the object could be useful as well. [Continue]");
		e.self:Say("By using this box created in cooperation with the [other sages] in Knowledge. you will be able to either extract a magical scroll or the binding used to hold the magic to the object.  Those elements will be the basis for my research.  Just bring anything you manage to extract for me.");
		e.other:SummonItem(17176);
	elseif(e.message:findi("other sages")) then
		e.self:Say("chuckles. 'Well my associates are working on their own theories for the creation of new magic.  I am sure that their projects are no where near advanced as mine. but even their primitive research could prove a boon in my own work.  If you happen to come across any of their research feel free to show it to my assistants. they will know the best manner in which to process it.  Bring reseach from Balic to Bolcen. and Gunyth's research to Acomar.  Thank you for your assistance.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
