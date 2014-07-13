function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have much to do here for the defense of our Temple and the appeasing of our patron Bertoxxulous, the Plague Lord. If the Plague Lord has gifted you with the desire to [serve his will] as a priest of the Bloodsabers I will assist in your training. If not, then leave me now and do not interrupt me again.");
	end
	if(e.message:findi("serve his will")) then
		e.self:Say("By spreading the disease, decay, and destructive powers of the Plague Lord you will in turn be gifted with great insight and power. First however you must learn to survive in this city, surrounded by those who would see you destroyed for your faith. Take this note to Torin Krentar. He will instruct you on how to acquire a suit of armor to protect you from the weapons of our [enemies].");
		e.other:SummonItem(20207);
	end
	if(e.message:findi("enemies")) then
		e.self:Say("The self-righteous ruler of this city, Antonius Bayle IV, is backed by the Knights of Thunder, paladins and clerics of the Storm Lord Karana, and the Temple Life, paladins and clerics of the Prime-Healer, Rodcet Nife. Be wary when not within the security of our temple here in the Qeynos Catacombs, should the Qeynos Guards discover you allegiances they would have you executed. Once you have been properly armored return to me and I will give you [further instruction].");
	end
	if(e.message:findi("further instruction")) then
		e.self:Say("The Priests of Life, those who claim allegiance to the Prime Healer, Rodcet Nife, have proven to be a large obstacle in our conversion of the people of Qeynos to the ways of the Plague Bringer. Lately a Priest of Life by the name of Rolon Banari has been campaigning amongst the beggars and sickly, a social group from which we have gained many converts. Find this meddling priest and bring me his head.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18716})) then --Tattered Note
		e.self:Say("Hmmm. Another rat has found its way to my doorstep, huh? Well, we may have use for you. Go find Rihtur, maybe he has an errand for you.");
		e.other:SummonItem(13598); --Ruined Training Tunic*
		e.other:Ding();
		e.other:Faction(21,100); --Bloodsabers
		e.other:Faction(135,-15); --Guards of Qeynos
		e.other:Faction(235,10); --Opal Dark Briar
		e.other:Faction(257,-25); --Priest of Life
		e.other:Faction(53,5); --Corrupt Qeynos Guards
		e.other:AddEXP(100);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 20197})) then
		e.self:Say("You have done well, " .. e.other:GetName() .. ". Take this Rusty Bloodsaber Mace to a forge and clean it up with a Sharpening Stone. It may take you several attempts to get all the rust off if you are not familiar with the process. Once that is done take the Refined Bloodsaber Mace to Torin Krentar with a Giant King Snake Skin and he will put the finishing touches on the weapon.");
		e.other:SummonItem(20198);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: qcat ID: 45089 NPC: Xeture Demiagar

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
