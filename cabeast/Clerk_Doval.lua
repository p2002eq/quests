function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("takes a sip of lager and looks up at you. 'Ahh! An adventurer of sorts? Looking for work, are we? If you have the time, I might have a bit of a [proposition] for you.'");
	elseif(e.message:findi("proposition")) then
		e.self:Say("I was sent by the Legion to deliver a restraining order to a few of the troopers. They have been ordered to stay away from the tavern. They have spent too much time drinking and not enough training. I am to have them initial the restraint order list, but my feet are killing me. Perhaps you could [deliver the restraining order]?");
	elseif(e.message:findi("restraining order")) then
		e.self:Say("Here is the restraint order. Go to the troopers and ask them to [sign the restraining order]. Also, make sure to have them sign it in alphabetical order. I am a very big stickler about this. The troopers' names are as follows; Ozlot, Ogmire, Nish Nish, Frogzin, Gummin, Inkin, Roklon, Taer, Fryp and Selbat. When all is done, I shall pay you.");
		e.other:SummonItem(18240); 								--Legion Order (0 signed)
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18250})) then	--Legion Order (all signed)
		e.self:Say("Thank you so much. I am so glad I did not have to deal with such a rowdy band of troopers as these. Please take some coin and perhaps a book from my personal library.");
		e.other:SummonItem(eq.ChooseRandom(12460, 12461)); 		--The Code of Combat, The Book of Knowledge
		e.other:Faction(30,30); 								--Cabilis Residents
		e.other:Faction(193,30); 								--Legion of Cabilis
		e.other:AddEXP(1200);
		e.other:GiveCash(0,5,0,0);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
