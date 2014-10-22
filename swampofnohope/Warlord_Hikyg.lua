function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What business do you have speaking to an Iksar Warlord? Be gone before you find yourself served as my evening meal. Go to Captain Nedar if you wish to assist my garrison. Fool.");
	elseif(e.message:findi("trooper reporting for duty")) then
		e.self:Say("It is about time they sent new troopers for my garrison!! This is the toughest garrison in Kunark!! And you're going to help prove it. The legion needs to get a hold of some new frog shields called Krup warrior guards. You're going to take this pack and fill it with not one, but four!! When you can return a full, combined pack to me, maybe you will show me that you're not as weak as you look!!");
		e.other:SummonItem(17043);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18211})) then
		e.self:Say("Ah!! Good to have you on board. We lack strong young recruits such as yourself. Take this bag. Your task is to seek escaped frogloks near this gate. Apparently, the slaves have been breaking loose from their shackles and attempting to head home. Fill and combine within the bag their broken shackles and return the filled box to me for your geozite tool.");  --not live text
		e.other:QuestReward(e.self,0,0,0,0,17994);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12661})) then
		e.self:Say("Great work!! You have kept the frogloks from returning home. I reward you with the geozite tool. You may find its purpose within Cabils' warriors guild. A true Iksar warrior should always have one."); --not live text
		e.other:QuestReward(e.self,0,0,0,0,12657);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12435, item2 = 12436, item3 = 12437, item4 = 5133})) then
		e.self:Emote("hands you plans for a trooper's pike head.");
		e.self:Say("Congratulations. You are now a trooper of the Legion of Cabilis. Now you may fight with honor and a mighty weapon.");
		e.other:QuestReward(e.self,0,0,0,0,12477,1200);
		e.other:Faction( 30,2);
		e.other:Faction( 193,2);
		e.other:Faction( 282,2);
		e.other:Faction( 317,2);
		e.other:Faction( 62,2);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12913})) then
		e.self:Say("What?!! You crushed all the shields!! You croak-faced skulking brute!! You don't deserve to be in my garrison!! I am going to recommend you for a promotion in hopes that you will be sent to hunt dragons and meet your end!");
		e.other:QuestReward(e.self,0,0,0,0,18073,2000);
		e.other:Faction( 30,2);
		e.other:Faction( 193,2);
		e.other:Faction( 282,2);
		e.other:Faction( 317,2);
		e.other:Faction( 62,2);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Scripted By: Fatty Beerbelly
--additional work by:  Jaekob
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
