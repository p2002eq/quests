--Heirophant Zand starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it. She is also for the 3rd and 5th shaman skullcap quests.

function event_say(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	if((e.message:findi("chosen savior")) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 2) then
		e.self:Say("I am honored to meet the one who shall pledge his life to the return of the Skulls of the Ancients. However, I must see proof of our prowess as of yet. Go to the outlands and retrieve one Froglok Hexdoll, and no, they are not found on Frogloks. They are shaman dolls made by the goblin tribe.");
	elseif(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Terror, young one. May the pain of the ancients guide you. Have you lost your Iron Cudgel of the Petitioner?"); --Could not find original text
	elseif(e.message:findi("no")) then
		e.self:Say("The Temple of Terror requires all young Scaled Mystics to wear the symbol of their station. Wear it with pride in these halls to display the rank you have attained. Go now, and serve The Faceless."); --Could not find original text
	elseif(e.message:findi("yes")) then 		--The Penance quest
		e.self:Emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. The Crusaders of Greenmist have a pit meant for you, should this prove to be impossible."); --Could not find original text
		e.other:SummonItem(18271); 				--A Ragged Book
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18272, item2 = 24770})) then --The Penance quest
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.");
		e.self:Say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
		e.other:SummonItem(5140); 				--Iron Cudgel of the Petitioner
		e.other:Ding();
	--Shaman Skull Quest No.3.1 turn in - Check for  A froglok hex doll
	elseif((item_lib.check_turn_in(e.trade, {item1 = 12734})) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 2) then
		e.self:Say("You have proven your prowess to me, now take this note to Crusader Quarg outside the city and he will test you further.");
		e.other:SummonItem(18054); 				--A note to take to crusader Quarg.
		eq.set_global("shmskullquest","4",5,"F"); --set a global flag so that user can do shm skull quest part 3.2
		e.other:Faction(282, 10); 				--Scaled Mystics
		e.other:Faction(193, 10); 				--Legion of Cabilis
		e.other:AddEXP(80000); 					--give decent xp...
		e.other:GiveCash(0,0,0,5);
		e.other:Ding();
	--Shaman Skull Quest No.5 turn in - Iksar Skull Helm and Iksar Skull and Cudgel of the Prophet
	elseif((item_lib.check_turn_in(e.trade, {item1 = 12741, item2 = 5144, item3 = 12740})) and (faction < 6) and tonumber(qglobals.shmskullquest) > 6) then
		e.self:Say("You have done well in proving yourself to this council, but we have yet more tests for you before you will be a true clairvoyant. Speak with Hierophant Dexl for your next test.");
		e.other:SummonItem(5145); 				--Give the player The Cudgel of the Channeler
		eq.set_global("shmskullquest","8",5,"F"); --set a global flag so that user can do shm skull quest part 6
		e.other:Faction(282, 10); 				--Scaled Mystics
		e.other:Faction(193, 10); 				--Legion of Cabilis
		e.other:AddEXP(120000); 				--give decent xp...
		e.other:GiveCash(0,0,0,10);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
