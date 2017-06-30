--Heirophant Zand starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it. She is also for the 3rd and 5th shaman skullcap quests.

function event_say(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	if((e.message:findi("chosen savior")) and (e.other:GetFaction(e.self) <= 4) and (tonumber(qglobals.shmskullquest) >= 2)) then
		e.self:Emote("closes his eyes and bows before you. 'I am honored to meet the one who shall pledge his life to the return of the Skulls of the Ancients. However, I must see proof of our prowess as of yet. Go to the outlands and retrieve one Froglok Hexdoll, and no, they are not found on Frogloks. They are shaman dolls made by the goblin tribe.");
	elseif(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Terror, young one. May the pain of the ancients guide you. Have you lost your Iron Cudgel of the Petitioner?"); -- Adlib
	elseif(e.message:findi("Lost")) then -- The Penance quest
		e.self:Emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. The Crusaders of Greenmist have a pit meant for you, should this prove to be impossible."); -- Adlib
		e.other:SummonItem(18271); -- A Ragged Book
	elseif(e.message:findi("What skulls of Di Nozok") and (tonumber(qglobals.shmskullquest) >= 6)) then
		e.self:Say("What?!! I have read of them, but that is all I know of the legendary mystic, err, mystics... whatever!! Where their remains rest is a mystery but those filthy goblins always seem to get ahold of things that are lost, all that infernal digging you see.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18272, item2 = 24770})) then -- Rites of Exoneration and Filled Penance Bag
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.");
		e.self:Say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
		e.other:QuestReward(e.self,0,0,0,0,5140,0); -- Iron Cudgel of the Petitioner
	--Shaman Skull Quest No.3.1 turn in
	elseif((tonumber(qglobals.shmskullquest) >= 2) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 12734})) and (e.other:GetFaction(e.self) <= 4)) then -- A Froglok Hex Doll
		e.self:Say("You have proven your prowess to me, now take this note to Crusader Quarg outside the city and he will test you further.");
		eq.set_global("shmskullquest","3",5,"F"); -- Completed Cudgel Quest 3.1
		e.other:Faction(282, 10); -- Scaled Mystics
		e.other:Faction(193, 10); -- Legion of Cabilis .
		e.other:QuestReward(e.self,0,0,0,5,18054,80000); -- The Bone Garrison
	--Shaman Skull Quest No.5 turn in
	elseif((item_lib.check_turn_in(e.self, e.trade, {item1 = 12741, item2 = 5144, item3 = 12740})) and (e.other:GetFaction(e.self) <= 4)) then -- Iksar Skull Helm, Iron Cudgel of the Prophet and Iksar Skull
		e.self:Say("You have done well in proving yourself to this council, but we have yet more tests for you before you will be a true clairvoyant. Speak with Hierophant Dexl for your next test.");
		eq.set_global("shmskullquest","7",5,"F"); -- Completed Cudgel Quest 5
		e.other:Faction(282, 10); -- Scaled Mystics
		e.other:Faction(193, 10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,10,5145,120000); -- Iron Cudgel of the Channeler
	end
	item_lib.return_items(e.self, e.other, e.trade)
end