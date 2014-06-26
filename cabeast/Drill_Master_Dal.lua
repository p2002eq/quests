function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Yes, yes!!  What do I have here?!!  Another [new recruit]?  If so, then speak up!  If not, then leave and do not waste my time nor risk your life.  I also seek a [legion soldier] if you be one.");
	elseif(e.message:findi("new recruit") or (e.message:findi("soldier")) or (e.message:findi("ready")) and e.other:GetFaction(e.self) > 4) then
		e.self:Say("No Iksar resident will have anything to do with you!!");
	elseif(e.message:findi("new recruit") and (e.other:GetFaction(e.self) < 5)) then
		e.self:Say("Yes.  You have the look of the Partisan.  I trust you have begun your blacksmith training.  If not, then do so.  Also, you should read all the books available to you in Fortress Talishan.  We are not dimwitted broodlings here.  You shall need the knowledge soon. That, or a coffin.  Ha!!  Here is your task, are you [ready for your task]?");
	elseif(e.message:findi("soldier") and (e.other:GetFaction(e.self) < 5)) then
		e.self:Say("Good news to my ears!!  I seek to prove to the War Baron that the infamous forsaken band of thieves who call themselves Marrtail's Marauders are operating within earshot of our city.  You must bring me proof that you encountered no fewer than four of these thieves.  Do so and I shall offer you an armor item unavailable to most.");
	elseif(e.message:findi("ready") and (e.other:GetFaction(e.self) < 5)) then
		e.self:Say("Yes. yes!!  It does not matter.  You must be ready.  I will hand you the Partisan pack.  Into it you shall combine one giant blood sac of the giant leech;  scout beads from a goblin scout; one sabertooth kitten canine and finally, three bone shards from decaying skeletons.  Hopefully, you will survive your attempt to obtain these items.  Return the full Partisan pack and you shall be rewarded with a curscale shield.");
		e.other:SummonItem(17997);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 12915, item2 = 12915, item3 = 12915, item4 = 12915})) then
		e.self:Emote("hands you a shimmering black piece of armor which smells quite horrid. You find it hard to keep it from slithering out of your hand. 'Here is the armor the tailors have been working on for the legion. You may test it for us. Keep up your fine work and I may have other pieces available for you to test.'");
		e.other:SummonItem(eq.ChooseRandom(12917,12918,12919,12920,12921));
		e.other:Faction( 193,10);
		e.other:Faction( 30,10);
		e.other:Faction( 282,10);
		e.other:Faction( 62,10);
		e.other:Faction( 317,10);
		e.other:AddEXP(1000);
		e.other:GiveCash(0,14,0,0);
		e.other:Ding();
	end
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 12673})) then
		e.self:Say("Well done recruit, I knew we could count on you to do the job.  Here is the reward you were promised");
		e.other:SummonItem(12674);
		e.other:Faction( 193,2);
		e.other:Faction( 30,2);
		e.other:Faction( 282,2);
		e.other:Faction( 62,2);
		e.other:Faction( 317,2);
		e.other:AddEXP(250);
		e.other:GiveCash(0,9,0,0);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
