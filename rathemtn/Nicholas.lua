function event_say(e)
	if(e.message:findi("boots of ro")) then
		if(e.other:GetFaction(e.self) < 5) then  -- amiable or better to get the quest
			e.self:Say("If you desire the mold needed for smithing the Boots of Ro, then first, you shall prove your power. I have long sought an ancient holy weapon called the brazen brass kilij. I have heard rumors of detailed plans on how to make it, coming from Faydwer. Seek out the kilij plans. Bring them to me and you shall have the mold.");
		else
			e.self:Say("You and I must be brothers and serve the Lord of Underfoot. Go to Kaladim and serve her cathedral. When you think you are ready. then ask Lord Datur if you are an [honored member] of the temple. If the answer is yes, then I will trust you.");
		end
	elseif(e.message:findi("chalice of conquest")) then
		if(e.other:GetFaction(e.self) > 4) then
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
		else
			e.self:Say("You must be the one Sir Dru of Kaladim sent to retrieve the candlestick which was broken in the [orc onslaught]. I have only this piece in my possession as the other portion was taken by an [odd druid] of these mountains. Should you reclaim it, I am sure the maker of the candlestick can patch it together.");
			e.other:SummonItem(12276);
		end
	elseif(e.message:findi("candle of bravery")) then
		if(e.other:GetFaction(e.self) > 4) then
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
		else
			e.self:Say("You must be the one Sir Dru of Kaladim sent to retrieve the candlestick which was broken in the [orc onslaught]. I have only this piece in my possession as the other portion was taken by an [odd druid] of these mountains. Should you reclaim it, I am sure the maker of the candlestick can patch it together.");
			e.other:SummonItem(12276);
		end
	elseif(e.message:findi("orc onslaught")) then
		e.self:Say("The orcs attempted to take the hill, as they do on a frequent basis. We repelled them, of course, but a [blue orc] rushed off with the [Chalice of Conquest]. Where he came from, I do not know. He was no part of the battle!! I believe he just found an opportune moment to loot our camp.");
	elseif(e.message:findi("blue orc")) then
		e.self:Say("I had a visiting ranger track him to his camp near Lake Rathetear. I spied the camp and saw his lifeless body near two other blue orcs. Apparently, he must have taken a fatal blow, but had enough stamina to make it to his camp. I returned the following day with my fellow paladins and found the camp long gone. The ranger, who was still with us, found two sets of tracks leading away. We found [orc remnants].");
	elseif(e.message:findi("orc remnants")) then
		if(e.other:GetFaction(e.self) > 4) then
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
		else
			e.self:Say("Here. We found this worthless orc bracelet with the name Klunga on it. There was also an orc shovel and a bag of Cauldron prawns. We left them, of course. The camp has now been taken over by the green-skinned orcs. I would advise you to stay clear of this camp in Lake Rathe.");
			e.other:SummonItem(12280);
		end			
	elseif(e.message:findi("odd druid")) then
		e.self:Say("The mountains have been plagued not only by beasts, but by evil druids!! They attempt to force all men from this land. One has stolen the foot of the candlestick which holds the [Candle of Bravery]. I remember that battle cry of hers, 'Long live the green!!'.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 12206}))) then -- Kilij Plans
		e.self:Say("Ahh!!  The kilij!!  The legend was true.  As for you..  the mold for the Boots of Ro.  Go and speak with Thomas for the final component.  Ask him of [Lord Searfire].  Brell be with you.");
		e.other:Faction(44,2); -- Clerics of Underfoot
		e.other:Faction(169,2); --Kazon Stormhammer
		e.other:Faction(219,2); --Miner's guild 249
		e.other:QuestReward(e.self,0,0,0,0,12304,100000);  -- Mold of the Boots of Ro
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
				
--END of FILE Zone:rathemtn  ID:50110 -- Nicholas
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------