function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I've little time for banter, unless you have come to me for training as a [new warrior] of the Bloodsabers move along.");
	elseif(e.message:findi("new warrior")) then
		e.self:Say("A warrior want to be is more like it. You've got a lot of work to do if you're going to be a valued member of the temple of Bertoxxulous. the Plague Bringer. That pompous ruler Antonius Bayle IV has this city in a tight grip with the support of our enemies. the temples of Rodcet Nife and Karana. It is not safe for us to walk the streets of Qeynos openly. You must learn to hold your tongue when not within the walls of our temple here in the Qeynos Catacombs. Should the Qeynos Guards discover your devotion to the Plague Bringer they would surely execute you. We have enemies all about and you must [learn to defend] yourself.");
	elseif(e.message:findi("learn to defend")) then
		e.self:Say("Take this note to Illie Roln. She will help get you outfitted in a suit of armor. Once you have been properly outfitted return to me and I will tell you how you can make yourself useful. I have a [small task] in mind.");
		e.other:SummonItem(20205);
	elseif(e.message:findi("small task")) then
		e.self:Say("The Priests of Life and Knights of Thunder often travel the roads from Qeynos carrying messages for the farmers of the Plains of Karana and the Knights of Truth in Freeport on the opposite coast of Antonica. We have recently been sending Bloodsabers to the Plains of Karana in search of a possible location for a new hidden temple should the need arise. One of the messengers of the Knights of Thunder has alerted the peasants of the plains the possibility of a Bloodsaber presence there and is using them to track our motions. Find the messenger. Lukas Hergo. and bring me his head.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18853})) then --Blood Stained Note
		e.other:Faction(21,100); --Bloodsabers
		e.other:Faction(135,-15); --Guards of Qeynos
		e.other:Faction(235,10); --Opal Dark Briar
		e.other:Faction(257,-25); --Priest of Life
		e.other:Faction(53,5); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13598,100); --Ruined Training Tunic*
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20175})) then
		e.self:Say("Well done " .. e.other:GetName() .. ". Now take this Rusty Scourge Warrior Broadsword to a forge and sharpen it with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done take the Tarnished Scourge Warrior Sword and a Giant King Snake Skin to Illie Roln and he will put the finishing touches on the weapon.");
		e.other:Faction(21,1);
		e.other:Faction(135,-1);
		e.other:Faction(235,-1);
		e.other:Faction(257,-1);
		e.other:Faction(53,1);
		e.other:QuestReward(e.self,0,0,0,0,20176,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qcat  ID:45081 -- Rocthar_Bekesna
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------