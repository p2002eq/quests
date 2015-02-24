function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. ". I am Bruax Grengar, master necromancer of the Bloodsabers. I assist not only young necromancers with their training but also aid all those Bloodsabers who have chosen to practice the [sorcerous arts]. If you a practitioner of a sorcerous art I can give you instructions to obtain an [outfit and robe] that will assist you in your work. Once you have been properly outfitted I will also assist you in acquiring a [Staff of the Bloodsabers].");
	elseif(e.message:findi("sorcerous arts")) then
		e.self:Say("I speak of those who practice the sorcerous arts other than necromancy: the arts of Enchantment, Magery, and Wizardry. It is a common misnomer proclaimed by those uneducated to the ways of the Plague Bringer that only Shadowknights and Necromancers serve Bertoxxulous. In fact this temple alone has members from all walks of life, from tailors, scholars, and blacksmiths to warriors and sorcerers.");
	elseif(e.message:findi("outfit and robe")) then
		e.self:Say("I have prepared this special curing kit for the crafting of an outfit and robe. The materials required for each article of clothing vary. Do you desire to craft a [scourge sorcerer cap], [scourge sorcerer wristband], [scourge sorcerer gloves], [scourge sorcerer boots], [scourge sorcerer sleeves], [scourge sorcerer pantaloons], or [scourge sorcerer robe]?");
		e.other:SummonItem(17125);
	elseif(e.message:findi("cap")) then
		e.self:Say("To craft a Scourge Sorcerer Cap you will require two [silk thread], klicnik drone bile, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
		e.other:SummonItem(19555);
	elseif(e.message:findi("wristband")) then
		e.self:Say("To craft a Scourge Sorcerer Wristband you require a [silk thread], klicnik drone bile, and a king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		e.other:SummonItem(19558);
	elseif(e.message:findi("glove")) then
		e.self:Say("To craft Scourge Sorcerer Gloves you require two [silk thread], klicnik drone bile, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559);
	elseif(e.message:findi("boot")) then
		e.self:Say("To craft Scourge Sorcerer Boots you require two [silk thread], klicnik drone bile, and two large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561);
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To craft Scourge Sorcerer Sleeves you require two [silk thread], klicnik warrior bile, and two large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557);
	elseif(e.message:findi("pantaloon")) then
		e.self:Say("To craft Scourge Sorcerer Pantaloons you require two [silk thread], klicnik warrior bile, and four large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
		e.other:SummonItem(19560);
	elseif(e.message:findi("robe")) then
		e.self:Say("To craft a Scourge Sorcerer Robe you will require three [silk thread], klicnik noble bile, two giant king snake skins, and a giant whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
		e.other:SummonItem(11395);
	elseif(e.message:findi("staff of the bloodsabers")) then
		e.self:Say("A Staff of the Bloodsabers is a useful implement for young sorcerers dedicated to Bertoxxulous the Plague Lord. I will assist you in the creation of a staff but first you must complete a task for me. The sorcerers of The Order of Three are supporters of Antonius Bayle IV. the haughty ruler of Qeynos. They lend magical aid to the Knights of Thunder and Priests of Life to identify and capture members of the Bloodsabers. A rather troublesome member of The Order of Three, Larkin Tolman, has recently been spotted at a settlement in the Western Plains of Karana. Find this Larkin Tolman and bring me his head.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 20204})) then
		e.self:Say("Well done. The Bloodsabers have many enemies within the city of Qeynos and its surrounding regions. You must exercise much caution when not within the safety of our temple here in the Qeynos Catacombs. Take this Rough Bloodsaber Staff and when you have gathered a Giant King Snake Skin, two Gnoll Fangs, and a Giant Fire Beetle Eye, return them to me with this staff and I will complete its construction.");
		e.other:QuestReward(e.self,0,0,0,0,20203);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 20203, item3 = 19946, item4 = 13251})) then
		e.self:Say("Excellent work! Here is your reward.");
		e.other:Faction(21,1);
		e.other:Faction(135,-1);
		e.other:Faction(235,1);
		e.other:Faction(257,-1);
		e.other:QuestReward(e.self,0,0,0,0,20264,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qcat  ID:45065 -- Bruax_Grengar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------