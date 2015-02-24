function event_spawn(e)
	local qglobals = eq.get_qglobals(e.other);
	hobble = qglobals["hobble"];
	eq.follow(hobble);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("awakens from a quick shuteye.");
		e.self:Say("Yawn.. Oh!! Hello. Don't mind the rusty old tin can. Sir Hobble is on a [quest] of sorts. I tell you, I would leave if he did not pay good wages to carry his equipment.");
	elseif(e.message:findi("quest")) then
		e.self:Say("Sir Hobble is searching for [three special dragons]. For all I know they are not even dragons. He can't see or hear very well. He still thinks I am the only troll squire around.");
	elseif(e.message:findi("three special dragons")) then
		e.self:Say("Apparently he is after three dragons which are supposedly named Azdalin, Gylton, and Xyfl. He will not rest until he holds their scales. I wish you could [find the dragons].");
	elseif(e.message:findi("find the dragons")) then
		e.self:Say("If you bring me the three scales I will be able to place them upon the next three victims of Sir Hobble. Then we can part from this accursed isle. He would never know the difference. Do this and I will give you a warrior weapon out of the old knight's armory.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12950, item2 = 12951, item3 = 12952})) then
		e.self:DoAnim(20);
		e.self:Emote("tumbles around and stands on his hands. With his feet he pulls a long polearm from a nearby weapons cache!! 'Woohoo!! I can taste the brew in Freeport already. Here you are my friend. A real Wurmslayer!!'");
		e.other:Faction(101,15);   -- Firiona Vie better
		e.other:Faction(92,15);    -- Emerald Warriors better
		e.other:Faction(314,15);   -- Storm Guard better
		e.other:Faction(193,-15);  -- Legion of Cabilis worse
		e.other:Faction(250,-15);  -- Pirates of Gunthak worse
		e.other:QuestReward(e.self,0,0,0,0,5057,700000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Turn-ins:
-- 12950 = dragon scale (Azdalin)
-- 12951 = dragon scale (Gylton)
-- 12952 = dragon scale (Xyfl)
-- Quest reward = Wurmslayer (5057)
-- Quest depends on Sir_Hobble.pl in Firiona for proper spawn of Squire_Fuzzmin
-- by Qadar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
