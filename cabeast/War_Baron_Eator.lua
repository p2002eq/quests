function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("turns to you and snorts in anger. Some mucus lands on your cheek.");
		e.self:Say("Troopers! I thought I ordered you to keep all new recruits away from this chamber! Go, child. The War Baron of Cabilis has no time for games. See this intruder out!!");
	elseif(e.message:findi("memory")) then
		e.self:Emote("takes a step back and thinks to himself. Phlegm dribbles off his lips.");
		e.self:Say("The Memory of Sebilis. Kept within my personal chambers. They have been taken. Taken by some croakin' Forsaken no doubt!! You have been sent to me because you show excellent prowess. Find my Memory and bring it to me with your footman's pike.");
	elseif(e.message:findi("trooper")) then
		e.self:Say("So you are a trooper? Word of your deeds has been spreading through the legion. If you truly wield the pike of a trooper, then go and serve the garrisons of swamp, lake and woods. Report to the Warlord and tell him you are a [trooper reporting for duty]. Their recommendations and your trooper pike shall earn you the rank of legionnaire.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18464, item2 = 22919})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:SummonItem(7881);
		e.other:AddEXP(20000);
		e.other:Ding();
		e.other:Faction(317,20);
		e.other:Faction(193,10);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18463, item2 = 22918})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:SummonItem(7881);
		e.other:AddEXP(20000);
		e.other:Ding();
		e.other:Faction(317,20);
		e.other:Faction(193,10);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12899, item2 = 12898, item3 = 12896, item4 = 5132})) then
		e.self:Emote("gulps down a wad of phlegm.");
		e.self:Say("My memory has returned! Boneripper! You are no footman. I grant you the rank of soldier. Go and forge your weapon. Do not return to me until you become a [brave trooper of the empire].");
		e.self:Say("Find Drill Master Kyg to help you in this task?  [Footman Moglok] needs help.");    --not live text, link to 4th pike beginning
		e.other:SummonItem(12476);
		e.other:Faction( 30,2);
		e.other:Faction( 193,2);
		e.other:Faction( 282,2);
		e.other:Faction( 317,2);
		e.other:Faction( 62,2);
		e.other:Ding();
		e.other:AddEXP(800);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18073, item2 = 18072, item3 = 18074, item4 = 5134})) then
		e.self:Emote("takes away your pike and hands you plans not for a pike head, but for the crown of another polearm.");
		e.self:Say("It is time to wield the weapon of a [true warrior of the legion]. You have done well, Legionnaire " .. e.other:GetName() .. "!");
		e.other:SummonItem(12478);
		e.other:Faction( 30,2);
		e.other:Faction( 193,2);
		e.other:Faction( 282,2);
		e.other:Faction( 317,2);
		e.other:Faction( 62,2);
		e.other:Ding();
		e.other:AddEXP(4000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
