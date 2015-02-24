--NPC: Byzar_Bloodforge  --Zone: kaladima
--modified by Qadar

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("State your business!!  I have no time for chitchat.  Well..  speak up. toad!!  What?!!..  Have you come here to [return goblin beads]?");
	elseif(e.message:findi("return goblin beads")) then
		e.self:Say("If you wish to return Runnyeye Warbeads you best have at least four of them.  Do not waste my time with any less.  If I am in a good mood I just may reward you with some trash, err..  I mean equipment from our armory.");
	elseif((e.message:findi("Zarchoomi")) or (e.message:findi("Corflunk"))) then
		e.self:Say("Do not speak the names of Zarchoomi and Corflunk!!  I have heard enough of those ogres!!  I would pay greatly for their heads!!");
	elseif(e.message:findi("take a little trip")) then
		e.self:Say("Yes.  You will do.  My sister was once engaged to a fellow warrior.  He disgraced her and left her crying at the altar.  I will have his head for such a slap in the face of my family.  His name was Trumpy Irontoe, once a member of the now defunct Irontoe Brigade.  I know not where he went.  Find his whereabouts and return his head to me.  Do so, and I shall make you an honorary member of the Bloodforge Brigade.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13931, item2 = 13931, item3 = 13931, item4 = 13931})) then
		e.self:Say("You finally have proven yourself a warrior, a slow one!!  Take this reward and ask for nothing else.  You should be proud to defend Kaladim and expect no reward.");
		e.other:SummonItem(eq.ChooseRandom(2113,2114,2115,2117,2119,2121,2122));
		e.other:Faction(314,15);   -- StormGuard better
		e.other:Faction(169,15);   -- KazonStormhammer better
		e.other:Faction(219,15);   -- MinersGuild249 better
		e.other:Faction(215,15);   -- MerchantsOfKaladim better
		e.other:Faction(57,-15);   -- CraknekWarriors worse
		e.other:AddEXP(10000);
		e.other:GiveCash(7,1,2,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13741, item2 = 13740})) then
		e.self:Say("I underestimated you.  You are truly a great warrior.  I reward you with a piece of my own Bloodforge armor.  You would be fine Bloodforge Brigade material!  How would you like to [take a little trip] in the name of the Bloodforge Brigade?");
		e.other:SummonItem(eq.ChooseRandom(3090,3090,3090,3090,3090,3090,3091,3092,3093,3094,3095,3096));
		e.other:Faction(314,15);   -- StormGuard better
		e.other:Faction(169,15);   -- KazonStormhammer better
		e.other:Faction(219,15);   -- MinersGuild249 better
		e.other:Faction(215,15);   -- MerchantsOfKaladim better
		e.other:Faction(57,-15);   -- CraknekWarriors worse
		e.other:AddEXP(10000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12136})) then
		e.self:Say("Ha!! His death brings me great happiness.  I owe you much.  Take this hammer.  It is the hammer of the Bloodforge Brigade.  May it serve you well.  Now go, so I can enjoy this moment of happiness alone.");
		e.other:SummonItem(13314);
		e.other:Faction(314,15);   -- StormGuard better
		e.other:Faction(169,15);   -- KazonStormhammer better
		e.other:Faction(219,15);   -- MinersGuild249 better
		e.other:Faction(215,15);   -- MerchantsOfKaladim better
		e.other:Faction(57,-15);   -- CraknekWarriors worse
		e.other:AddEXP(10000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
