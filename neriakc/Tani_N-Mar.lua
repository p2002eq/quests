-- Rogue Epic NPC/Guildmaster -- Tani_N`Mar

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  You must be a stranger or [new to the Hall].  If you are a stranger. be warned that these halls are intended for the Ebon Mask only. If you are found to be a member of another house. you just may feel the sting of a blade in your back.");
	elseif(e.message:findi("i am new to the hall")) then
		e.self:Say("Then I am glad to make your acquaintance. Have you ever been to Freeport?  If not. how would you like to go?  It is a test of your cunning we wish.  Are you prepared to risk your young life?  Are you [ready to venture to Freeport]?");
	elseif(e.message:findi("i am ready to venture to freeport")) then
		e.self:Say("Find a way to the port of Freeport.  Seek out Giz Dinree.  She is usually near the shores at night.  She is your contact. Tell her you were [sent by TanI].  She will fill you in on your mission.  Good luck.  Do not waste time practicing your skills. Go as you are.");
	elseif(e.message:findi("book of souls")) then
		e.self:Say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, " .. e.other:Race() .. "?'");
	elseif(e.message:findi("note")) then
		e.self:Say("Oh, you want that piece of paper Stanos was so hot after? Well it's mine now, though it looks like ogre scratch to me. You're not getting it, Stanos is not getting it, and Hanns is not getting it. It is MINE! Now, " .. e.other:Race() .. ", scamper off like the dog you are, before I decide I need more practice with these short swords!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13892})) then
		e.self:Say("Good work! I knew you could prove your worth. Most waste time training. I do not reward those who waste my time. Please take this. It is from our horde, from countless robberies. I hope you can use it to advance yourself. Remember to always stay faithful to Neriak.");
		e.other:Faction(90,5);
		e.other:Faction(135,-5);
		e.other:Faction(361,-5);
		e.other:Faction(133,-5);
		e.other:Faction(31,-5);
		e.other:QuestReward(e.self,0,8,0,0,5066,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE  Quest by: Solid11  Zone:neriakc  ID:42000 -- Tani_N`Mar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
