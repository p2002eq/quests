--Bard Tomes/Planar Armor Exchange
--Added tome handins, fixed up this broken file. Dunno if my fixes work yet, but
--it's closer than just spewing the light and dark greetings multiple times at anyone
--who's unfortunate enough to hail this npc. -Kilelen
function event_say(e)
	if(e.message:findi("Hail")) then
		if((e.other:Race() == "Dark Elf") or (e.other:Race() == "Iksar") or (e.other:Race() == "Troll") or (e.other:Race() == "Ogre")) then
			e.self:Emote("raises a brow sharply and gains a face of almost belittling amusement as he eyes " .. e.other:GetName() .. " before him. 'Do you not think yourself out of place here, dark one? Please, do not be offended, for that is not my intent in the least, of course. I would rather see your needs fulfilled to the utmost of your necessity than see you leave this place no more knowledgeable than before your arrival. The library of Myrist in the center of our city is home to the scholars of New Tanaan, who believe themselves to have ascended beyond the 'petty mortal squabbles");
		else
			e.self:Emote("gives a gentle, though formal nod of his head in warm greetings. 'Welcome, " .. e.other:GetName() .. ", to the district of Tanaan. We have the utmost faith that this humble place will accommodate your every need most generously. The merchants in scattered throughout our region are quite useful to any tradesmen or adventurer seeking to restock on supplies and the devises of teleportation found in this district should be more than suitable for one of your ilk. If you have come to Tanaan seeking guidance in the ways of mentorship and skills, then know only success in your search for we are more than prepared to accommodate the needs of almost any adventurer. The bards of Norrath who seek guidance without the ravings of a philosophical, political, or religious zealot will find myself to be a most formidable suitor to their needs.'");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4861})) or (item_lib.check_turn_in(e.trade, {item1 = 4862})) or (item_lib.check_turn_in(e.trade, {item1 = 4863})) or (item_lib.check_turn_in(e.trade, {item1 = 4864})) or (item_lib.check_turn_in(e.trade, {item1 = 4865})) or (item_lib.check_turn_in(e.trade, {item1 = 4866})) or (item_lib.check_turn_in(e.trade, {item1 = 4867}))) then --Imbrued Platemail Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
