---- Changes by Kagehi.
---- Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
---- Since we don't want to hand people things that they can't normally get, or
---- stuff they haven't earned, we need to track which stage in the quest they
---- are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
---- 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
---- and 7 = Initiate's Cloak.
---- 8 = Cloak of the Dar Khura Recruit

function event_say(e)
	fac = e.other:GetFaction(e.self);

	if(e.message:findi("Hail")) then
		e.self:Say("Well hello... How may I help you?");
	elseif(e.message:findi("Merchant Ayyad")) then
		e.self:Say("You can find Merchant Ayyad in 'The Merchants' Quarter which lies in the middle of the city just east of the Royal Palace.");
	elseif(e.message:findi("love potion")) and (fac <= 4) then -- Behari is Missing Quest
		e.self:Say("Hmmm, while I dabble in the art of potions mixing myself, I am no scholar in the field. Perhaps Spiritist Ragnar would be of more assistance to you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then -- Acrylia Slate of Shar Vahl
		e.self:Say("" .. e.other:GetName() .. "! So good to see you! It is my honor to guide you for a time. May the spirits inspire my words that you might grow wise in the hearing. You are young and need to be strengthened. Bring me three hairless hides of rockhopper young. You can find them in the crater surrounding our city, formed when the portion of Norrath our city is built upon came to rest in its current location.");
		e.other:QuestReward(e.self,0,0,0,0,2877); -- Acrylia Slate of Shar Vahl
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3488, item2 = 3488, item3 = 3488})) then -- 3x Hairless Rockhopper Hide
		e.self:Say("You've completed my first task and as a reward I present you with this small token. May it serve to protect you from our enemies.");
		e.other:SummonItem(3489); -- Hopperhide Buckler
		e.self:Say("As a member of the sacred Dar Khura, you will be asked to become proficient in the art of brewing. Sweetwater is produced by combining xakra bile and scorpion blood with a flask of water in a brew barrel. Pour two flasks of sweetwater into this cask and return it to me.");
		eq.signal(155164,1,0); -- Elder Spiritist Grawleh
		e.other:QuestReward(e.self,0,0,0,0,17232,500); -- Empty Cask
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3493})) then -- Cask of Sweetwater
		e.self:Emote("takes a sip from the cask and furrows his brow.");
		e.self:Say("Well, it's a start I suppose. With a little practice you are certain to get better. Here is some hide treatment I just made, it will make your buckler stronger. It just needs some time to ferment before I apply it.");
		e.self:Say("Citizens often need assistance and the Dar Khura must be available whenever possible. [Merchant Ayyad] has requested someone to run an errand and I am sending you. Return to me with Ayyad's seal, the hide treatment, your buckler, and your initiate's cloak.");
		e.other:QuestReward(e.self,0,0,0,0,3494,500); -- Hopperhide Treatment
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3489, item2 = 3494, item3 = 3499, item4 = 2878})) then -- Hopperhide Buckler, Hopperhide Treatment, Ayyads seal & Initiate's Cloak of Shar Vahl
		e.self:Say("Well done you " .. e.other:GetName() .. ", your deeds will not go unnoticed. You will now be known throughout the land as an official recruit of the revered Dar Khura. As your status improves so will the rewards for your service. Here is your treated buckler, your new cloak, and a spell I trust you will find a use for. Show your buckler to Fharra Cawfeet and she will continue your training.");
		e.self:Emote("shouts, 'My fellow Vah Shir, I present to you the newest recruit to the sacred Dar Khura. " .. e.other:GetName() .. " has shown great potential in the service of our sect. Please join me in thanking this citizen for service to our people!'");
		e.other:SummonItem(3495); -- Treated Hopperhide Buckler
		e.other:SummonItem(3496); -- Cloak of the Dar Khura Recruit
		eq.set_global("Shar_Vahl_Cit","8",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,15275,500); --Spell: Frost Rift.
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5542, item2 = 3496, item3 = 5543})) then -- Mydis Token, Cloak of the Dar Khura Recruit & Imbued Hopperhide Buckler
		e.self:Say("Your progress fills me with pride. Please take these things as a sign of our appreciation. I hope that they help you as much as you have helped us. When you are ready to continue your training, please contact Jaima Seyel. You'll most likely find her in the Dar Khura Guildhall. She will train you from this point.");
		e.self:Shout("Fellow citizens, may I present to you with our newest apprentice to the sacred Dar Khura. " .. e.other:GetName() .. " has assisted us for some time now and we can only hope that this assistance doesn't go unnoticed. Now, please join me in thanking " .. e.other:GetName() .. " for such selfless service to our people.");
		e.other:Faction(68,20); -- Dar Khura
		e.other:SummonItem(5543); -- Imbued Hopperhide Buckler
		e.other:SummonItem(5544); -- Cloak of the Dar Khura Apprentice
		e.other:QuestReward(e.self,0,0,0,0,15282,1500); -- Spell: Spirit Strike
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
