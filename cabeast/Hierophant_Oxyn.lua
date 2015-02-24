--Hierophant Oxyn is for the Greenmist quest and is part of the eighth and final quest in the series. He also gives out the Cursed Wafer quest and shaman skullcaps 1 and 2.

--Please note a bare minimum has been done for the shaman quests that Hierophant Oxyn gives, as I was only concerned with the Greenmist quest.

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	--Cursed Wafers Event_Say
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, and may the pain of the ancients guide you. You have come to us for guidance, have you not? We are the Hierophants of Cabilis and we guide the young Scale Mystics. All petitioners shall speak with me of [temple tasks].");
	elseif((e.message:findi("temple tasks")) and (e.other:GetFaction(e.self) < 6) and (e.other:Class() == "Shaman")) then
		e.self:Say("The Temple of Terror requires all young Scaled Mystics to [perform daily tasks.]. The tasks are necessary to the upkeep of our order as well as that of our brothers, the Crusaders of Greenmist.");
	elseif((e.message:findi("daily tasks")) and (e.other:GetFaction(e.self) < 6) and (e.other:Class() == "Shaman")) then
		e.self:Say("We require many components for various rituals. Take this Component mortar and fill it with the following items - foraged [mud crabs]. two small mosquito wings and one portion of bone chips. You must then use the pestle and combine all the components. When you have a full component mortar, you may return to me and I shall pay you your wages, but most importantly, you shall prove your devotion to the Scaled Mystics.");
		e.other:SummonItem(17020); 								--give the player the combine box: Component Mortar
	elseif(e.message:findi("mud crabs")) then 					--Cursed Wafers quest
		e.self:Say("Mud crabs are tiny crustaceans which live along the mudcaked shores of the Lake of Ill Omen. You can forage for them and find a handful of them at a time.");
	--Shaman Skull Quest No.1 Event_Say
	elseif((e.message:findi("lost skulls")) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 0) then
		e.self:Say("You must have heard of the Trilac Brotherhoods disappearance. They are the skulls of three soon to be ancients. They were taken from this temple by a silent intruder. Crusaders are always on duty. I do not know how they got into our vault. Every petitioner is ordered to search for the three skulls and return them to me along with their petitioner cudgel and then they shall become clairvoyants.");
	elseif((e.message:findi("iron cudgel")) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 0) then
		e.self:Say("If you are looking to be handed the Iron Cudgel of the Clairvoyant then you are sadly mistaken. Perhaps if you were to gather a few [lost skulls] for the temple we may find you worthy to wield one.");
	--Shaman Skull Quest No.2 Event_Say
	elseif((e.message:findi("other skulls")) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 1) then
		e.self:Say("A couple of rogue mystics have taken two skulls from another one of our temples. They could not have gone far, but i fear that one of the skulls was [damaged] in their escape.");
	elseif((e.message:findi("damaged")) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 1) then
		e.self:Say("A guard had managed to attack one of the mystics, but hit the bag carrying the skull.  I fear that the skull has been damaged, but it can be repaired.  Acquire it's pieces and some Mendglow clay to put it back together.");
	elseif(e.message:findi("liquid")) then 						--Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Say("The bottle contains deklium in a liquid solution. The metal of prophecy has been determined to rest in a mass of living earth. Our scholars have written of a mass of ore that fell from the heavens. This ore was used in the creation of a blade of our father, Rile. We have been filled with visions of this blade. I have seen it in the hands of our Crusaders as they march towards the new age of Greenmist! Seek out the corrupted earth that guards the interlopers. We have an alchemist near there. He will be able to use the deklium to determine which golem contains the metal. Take care to go in force. I sense that there will be a battle.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 3895})) then 	--Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Emote("takes the note and begins to howl into the air! 'The visions are true! The new prophecy begins today, Crusader,' the mystic growls with pleasure. He quickly turns and takes a bottle of murky liquid from one of his potion bags and hands it to you. 'Take this and keep it safe. Our visions have told of this day. We have been able to learn of the metal of prophecy. This [liquid] will help us to locate its true resting place!");
		e.other:SummonItem(3892);				--Bottle of Liquid Deklium
		e.other:Faction(62,20);
		e.other:Faction(193,10);
		e.other:AddEXP(5000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3886})) then --Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Emote("holds the ore in his hands and begins to chant. His eyes go white as he raises the chunk of ore above his head. He lowers his arms and shakes his head for a moment. His eyes return to their normal state as they focus on you. The shaman hands you the ore and says, 'Seek out the creator of Rile's blade. He is still on this plane. I have felt his torment. Take this note to Librarian Zimor. He learned a great deal from the tome and can instruct you further.'");
		e.other:SummonItem(3886);				--Chunk of Tynnonium
		e.other:SummonItem(3893);				--Note to Librarian Zimor
		e.other:Faction(62,20);
		e.other:Faction(193,10);
		e.other:AddEXP(5000);
		e.other:Ding();
	--Cursed Wafers turn in
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12403}) and (e.other:Class() == "Shaman")) then --Full Component Mortar
		e.self:Say("We appreciate your service. Take a few copper for your deed as well as some of our cursed waters. They will provide you with nourishment. As for future tasks, we are searching for a few [lost skulls] and i am sure you are searching for your [iron cudgel of the clairvoyant] And i also hear that the furscales are in need of some broodlings to do some manual labor. Tell them Oxyn sent you.");
		eq.set_global("shmskullquest","1",5,"F"); --set a global flag so that user can do shm skull quest
		e.other:SummonItem(12406, 2); 			--Cursed Wafers
		e.other:Faction(282, 10); 				--Scaled Mystics
		e.other:Faction(193, 10); 				--Legion of Cabilis
		e.other:Ding();
	--Shaman Skull Quest No.1 turn in - Check for  Logrin Skull, Morgl Skull, and Waz Skull hand in along with Iron Cudgel of the Petitioner
	end
	if((item_lib.check_turn_in(e.trade, {item1 = 12721, item2 = 12722, item3 = 12723, item4 = 5140})) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 0) then
		e.self:Say("Excellent, you have retrieved the three skulls of the ancients for us.  There are yet mroe skulls that I must ask you to retrieve before I can assist you in furthering your progress to becoming a clairvoyant. I will tell you with whom you need to speak to to continue the path of clairvoyance upon bringing me the [other skulls].");
		eq.set_global("shmskullquest","2",5,"F"); --set a global flag so that user can do shm skull quest part 2
		e.other:SummonItem(5141); 				--Iron Cudgel of the Clairvoyant
		e.other:Faction(282, 10); 				--Scaled Mystics
		e.other:Faction(193, 10); 				--Legion of Cabilis
		e.other:AddEXP(2000); 					--give decent xp...
		e.other:GiveCash(0,0,0,1);
		e.other:Ding();
	--shaman skull quest no.2 turn in - check for Skull with I and Skull with II turn in and cudgel
	end
	if((item_lib.check_turn_in(e.trade, {item1 = 12724, item2 = 12725, item3 = 5141})) and (e.other:GetFaction(e.self) < 6) and tonumber(qglobals.shmskullquest) > 0) then
		e.self:Say("We are in your debt. You are truly one who shall collect all the lost ancient skulls. Take your weapon. Go to Hierophant Zand and he shall guide you further. Tell him you are [the chosen saviour].");
		eq.set_global("shmskullquest","3",5,"F");	--set a global flag so that user can do shm skull quest part 3
		e.other:SummonItem(5142); 				--Iron Cudgel of the Seer
		e.other:Faction(282, 10); 				--Scaled Mystics
		e.other:Faction(193, 10); 				--Legion of Cabilis
		e.other:AddEXP(60000); 					--give 2 blues of xp
		e.other:GiveCash(0,0,5,1);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
