function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18207)) then -- Guild Summons
		e.other:Message(15,"As your reptilian eyes adjust to the darkness of the room, an imposing Iksar turns towards you, addressing you with a sharp hiss. 'I am Harbinger Glosk. The time has come young one. You have chosen the path of the Necromancer. Open your inventory and read the note within. Once you are ready to begin your training, hand the note to me and we will continue.'");
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Emote("halts his chanting. 'You dare to interrupt me? You had best have a good reason. I care not for small talk.'");
	elseif(e.message:findi("keepers grotto")) then
		e.self:Say("Keepers Grotto is where you shall find the Keepers. They study and scribe the spells of our dark circle. The grotto is not far from here, near the arena called the Gauntlet.");
	elseif(e.message:findi("new revenant")) then
		e.self:Say("Yes. You are. You shall do as I command. Take this. It is incomplete and must be ready for the emperor within the half season. You must find the Four Missing Gems. When you have them, then you will have to Quest for the [" .. eq.say_link("forge of dalnir",false,"Grand Forge of Dalnir") .. "]. Within it's fire, all shall combine. Return the Sceptre to me with your Revenant Skullcap. Go.");
		e.other:SummonItem(12873); -- Unfinished Sceptre
	elseif(e.message:findi("forge of dalnir")) then
		e.self:Emote("scratches his chin. 'I know little of it other than that it once belonged to the ancient Haggle Baron, Dalnir. From what I have read, its fires require no skill, but will melt any common forge hammer used. Dalnir was said to have called upon the ancients for a hammer which could tolerate the magical flames.'");
	elseif(tonumber(qglobals.necskullquest) >= 9) then
		if(e.message:findi("gem of reflection") then
			e.self:Say("I have not been asked that in ages but I can recall the last person that asked me. If you are in league with that scoundrel Ixpacan, I will slay you where you stand! But if you are not, you will not mind ridding your kin of a [" .. eq.say_link("menace") .. "] as of late.");
		if(e.message:findi("menace") then
			e.self:Say("It seems as though a rogue marauder in a jungle near here has attacked several of our trade suppliers. If you can bring me back his head I will gladly share the information you have asked for.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18207})) then -- Guild Summons
		e.self:Say("Another apprentice has reached rebirth. You now have become one with the Brood of Kotiz. We study the ancient writing of Kotiz. Through his writing we have found the power of the dark circles. Listen well to the scholars within this tower and seek the [" .. eq.say_link("Keepers Grotto") .. "] for knowledge of our spells. This drape shall be the sign to all Iksar that you walk with the Brood. Now go speak with Xydoz.");
		e.other:Faction(24,100); -- Brood of Kotiz
		e.other:Faction(193,25); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,12407,100); -- Drape of the Brood
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12874, item2 = 4265})) then -- Sceptre of Emperor Vekin and Revenant Skullcap
		e.self:Emote("presents to you a glowing skullcap. 'This is the treasured cap of the sorcerers of this tower. Let all gaze upon you in awe. You are what others aspire to be. I look forward to reading of your adventures, Sorceror " .. e.other:GetName() .. ".'");
		e.other:Faction(24,10); -- Brood of Kotiz
		e.other:Faction(193,2); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,2,4266,10000); -- Sorcerer Skullcap
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14794})) then -- Illegible Note: Boots
		e.self:Emote("hisses and says venomously, 'And I am disturbed yet again. I hope for your sake it is important.'");
		e.self:Emote("The gaunt necromancer looks down at the paper in his hands and after reading a few lines gasps, then falls into a violent coughing fit. After recovering he takes a deep breath, puffs his chest out and hands the paper back to you. With his head held high, he says in a raspy voice, 'Show this to Rixiz. He will test you.'");
		e.other:QuestReward(e.self,0,0,0,0,14794); -- Illegible Note: Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14793})) then -- Illegible Note: Greaves
		e.self:Emote("snatches the note out of your hands, obviously irritated. After reading a few lines, he glances up at you, his brow furrowed, then looks down again to continue reading. When he's finished, he hands the note back to you and takes a deep breath, shuddering slightly. He then says, 'Xydoz. Take this to Xydoz. He will test you.'");
		e.self:Emote("watches you carefully as you leave.");
		e.other:QuestReward(e.self,0,0,0,0,14793) -- Illegible Note: Greaves
	elseif(tonumber(qglobals.necskullquest) >= 9 and item_lib.check_turn_in(e.self, e.trade, {item1 = 34070})) then -- Rogue Marauder's Head
		e.self:Say("You have done well in doing what I have asked. To make a gem of reflection you will need some Mt Death mineral salts, a green goblin skin, spiroc bone dust, essence of rathe, blue slumber fungus, and a vial of pure essence. Combine all of these in this container and you will have what it is you seek.")
		e.other:QuestReward(e.self,0,0,0,0,34071,0); -- Glosk's Sack
	end
	item_lib.return_items(e.self, e.other, e.trade)
end