function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. adventurer!!  Stand tall and fight for the forest folk and all good races of Norrath. We shall claim this land for the kingdom of Thex!  My warriors shall not fail.  Already we patrol deep in the wilds of Kunark.  We welcome all mercenaries and urge adventurers to [join the defense of the outpost].");
	elseif(e.message:findi("join the defense")) then
		e.self:Say("I salute you!!  Join the hunt.  Reports from the front line indicate a rise in the drolvarg	population.  Abandon your fear and slay these beasts for the greater good.  Already. they have taken far too many lives. even my sibling's!!  I shall pay you your wages upon the return of four drolvarg teeth.");
	elseif(e.message:findi("What about your sibling")) then --Captain Nealith's Brother quest
		e.self:Emote("appears saddened by the mention of his sibling. 'My brother Marltek has been missing for quite some time. I found coarse Drolvarg hair inside his tent which leads me to believe he has become a meal for the dogs. CURSE THE EVIL DOGS!! I shall see them all dead!!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12977, item2 = 12977, item3 = 12977, item4 = 12977})) then
		e.self:Emote("Captain Nealith tosses the teeth into a very large cask full of similar teeth.");
		e.self:Say("Fine work, " .. e.other:GetName() .. ". I wish all my own troops showed the same tenacity. I salute you. This will keep you well fed during your long patrols. Use your wages to better equip yourself. Continue the fight!! The General is pleased.");
		e.other:Faction(418,1);
		e.other:Faction(14,1);
		e.other:Faction(193,-3);
		e.other:Faction(250,-3);
		e.other:QuestReward(e.self,7,12,3,0,13155);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18076})) then --blood soaked note Captain Nealith's Brother quest
		e.self:Emote("nearly faints after reading the letter. 'Dear Marltek!! I shall miss you. There is more evil in this land!! Madness beyond description. Thank you " .. e.other:GetName() .. ". You put my soul at ease and give me new direction. Please accept my brothers blade. He found it in the wilds. May you use it to slay many Drolvarg!!'");
		e.other:Faction(419,50); -- +Inhabitants of Firiona Vie
		e.other:Faction(92,50); -- +Emerald Warriors
		e.other:Faction(314,50); -- +Storm Guard
		e.other:Faction(250,-50); -- -Pirates of Gunthak
		e.other:Faction(193,-50); -- -Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,14,12978,25580); --Glaive of Marltek
	end
	e.self:Emote("Captain Nealith holds the canine in his palm.");
	e.self:Say("Good work, but you will have to slay more than this to earn your wages.");
end

--Author: Shadestrike
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
