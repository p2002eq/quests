--Elder_Tal_Almad (203418)
--Tome of Dark Power Quest
--potranquility

--Edit on April 19, 2007 for Tome of Dark Power quest - Kilelen  
--Converted to LUA by Daeron

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome traveler, are you [" .. eq.say_link("I am here to meet with someone",false,"here to meet with someone") .. "] or are you [" .. eq.say_link("I am new to this place", false, "new to this place?") .. "]");
	elseif(e.message:findi("new to this place")) then
		e.self:Say("Please take some time to look around. but be sure to speak with one of my fellow Elders prior to tampering with anything that may resemble a magical portal.  Tampering with the wrong object or in the wrong location on this island may take you to a very different and dangerous plane of existence.");
	elseif(e.message:findi("here to meet with someone")) then
		e.self:Say("Well then, if you do not need my assistance, I will continue my work. May you find that which you seek.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 28741})) then	--Locked Tome of Dark Power
		e.self:Emote("looks the book over carefully, 'This is a most interesting find indeed. You seek to break the seal that surrounds this tome? This may take some time, please be patient.' As he waves his hand over the lock and mumbles a few syllables, the clasp instantly falls open. With a surprised look he says, 'That was odd, the seal was easier to break then I thought it would be. It's almost. . . Well, it's almost as if the book had a will to be opened. I sense much power inside this tome, you best be careful with it.' He hands the book back to you.");
		e.other:SummonItem(28742);	--Unlocked Tome of Dark Power
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
