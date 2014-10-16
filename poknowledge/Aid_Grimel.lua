--PoP Crafting quests/Signets of the Councilmen/Planar Progression
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		--eq.set_global("pop_cod_final","1",5,"F"); --debugging
		e.self:Say("Greetings and Salutations " .. e.other:GetName() .. "! I am Grimel, aid to the mighty paladin Councilman Taldarius. In between his duties to the city, Taldarius and I spend most of our time in the Planes cleansing evil. Even now I am preparing for battle. Taldarius intends to go further into the Planes than ever before on our next trip and I am working on gathering the special supplies we need. If you are willing to help I may have some use for your skills if you are a master of trades and have traveled in the Planes.");
	else
		if(tonumber(qglobals.pop_cod_final) == 1 and tonumber(qglobals.pop_cod_final) == 1) then --Must have killed Bertox and rescued Mylik and Adler
			if(e.message:findi("willing to help and am a master of trades")) then
				e.self:Say("Excellent! I am looking for a smith to add a special imbue to Councilman Taldarius's armor. Are you well versed in the art of smithing?");
			end
			if(e.message:findi("versed in the art of smithing")) then
				if(e.other:GetSkill(63) > 219) then --Blacksmithing
					e.self:Say("Thank you for offering to help " .. e.other:GetName() .. ". Take this breastplate and clean it with a diluted acid wash to get all of the debris out of it. Brew the wash by combining acid and three celestial essences. Once the armor is cleaned, coat it with hurricane temper. Finally add two black diamonds of nightmare to the breastplate. This should provide adequate protection for our next journey.");
					e.other:SummonItem(15984); --Filthy Breastplate
				else
					e.self:Say("You do not seem to be skilled enough.");
				end
			end
			if(e.message:findi("skill in brewing") and e.other:HasItem(16249)) then --Hardened Leather Signet
				if(e.other:GetSkill(65) > 219) then --Brewing
					e.self:Say("I bet you could make a wicked brew! However I am forced to drink a refreshing drink while out adventuring. I do have this powder that will give the best drinks quite a bite though. Mix the powder in with two Kaladim Constitutionals and a flask of pure water. If you need more dust just ask for it! Put three twice brewed constitutionals and the signet in this drink barrel. As hard as drink barrels are to get these days, you need to return it to me along with the drink you create with it.");
					e.other:SummonItem(17179); --Portable Drink Barrel
					e.other:SummonItem(15992); --Fermenting Dust
					e.other:SummonItem(15992); --Fermenting Dust
					e.other:SummonItem(15992); --Fermenting Dust
				else
					e.self:Say("You do not seem to be skilled enough.");
				end
			end
			if(e.message:findi("put my jewel craft skills to the test") and e.other:HasItem(16250)) then --Clay Signet
				if(e.other:GetSkill(68) > 219) then --Jewelcraft
					e.self:Say("My hand was crushed when I used it to deflect a blow from a War Boar that was headed towards Taldarius's back. For some time afterwards my hand was crippled but Brell saw to it I regained full use of it. The ring I used to wear was damaged beyond repair and my hand was never steady enough to etch a new one. If you would make me a new one by combining a mounted blue diamond, the etching dust and etching tools in a jewelry kit. Then take the faceted gem and combine it with a bar of pure enchanted velium and my signet. I have no idea how the pure bars are made. You may want to seek the help of the ice dwarves.");
					e.other:SummonItem(15988); --Etching Dust
				else
					e.self:Say("You do not seem to be skilled enough.");
				end
			end
			if(e.message:findi("ready to use some clay") and e.other:HasItem(16251)) then --Wooden Signet
				if(e.other:GetSkill(69) > 219) then --Pottery
					e.self:Say("On our last tome gathering expedition a stray arrow in the Plane of War struck our urn filled with sacred water. It was quite a waste of sacred water! Three large enchanted blocks of clay, three lacquered opals, a vial of purified mana, a ceramic lining, sculpting tools and the urn pattern should make an unfired urn. The urn is so large you will need to fire it with three divine crystalline glazes. Once you have the urn it needs to be filled with three sacred waters and the signet as a cap.");
					e.other:SummonItem(16243); --Urn Pattern
				else
					e.self:Say("You do not seem to be skilled enough.");
				end
			end
			if(e.message:findi("am skilled with the needle") and e.other:HasItem(16252)) then --Metal Signet
				if(e.other:GetSkill(61) > 219) then --Tailoring
					e.self:Say("I appreciate the help " .. e.other:GetName() .. ". I need a new tunic made for Councilman Taldarius. Last trip through the Plane of Disease, one of those flies spit mucus on him and it dripped through his armor seams! The result was a gooey mess that ate away all the leather underneath. It was a blessing he was wearing something under all that metal! Combine three firesilk swatches, a vial of purified mana, an emblem of fire, a firestrand curing agent, a tunic pattern and the signet. Bring it to me when you have completed it.");
				else
					e.self:Say("You do not seem to be skilled enough.");
				end
			end
			if(e.message:findi("skills with a fletching knife") and e.other:HasItem(1079)) then --Marked Signet
				if(e.other:GetSkill(64) > 219) then --Fletching
					e.self:Say("Aye I can see you are skilled with the fletching knife " .. e.other:GetName() .. ". It is good too, I need to replace Councilman Taldarius's bow from Plane of Air. Combine a planing tool, two wind metal bow cams, an air arachnid silk string, a featherwood staff and the signet. I hope the bow will be up to his standards, he sure loved his old bow.");
				else
					e.self:Say("You do not seem to be skilled enough.");
				end
			end
			if(e.message:findi("master chef") and e.other:HasItem(16254)) then --Runed Signet
				if(e.other:GetSkill(60) > 219) then --Baking
					e.self:Say("When we adventure in the Planes there is only one meal that keeps us in top fighting shape. It is called a Bristlebane's Party Platter. Unfortunately the platter is awkward and not easy to adventure with so you need to place them in this satchel. I know not how to make the Platter, a rather nice female Halfling cleric always used to deliver them to us but I heard she was crushed by a Regrua while hunting for a rare component in the Plane of Water. Brell bless her soul! Combine three of the platters and the signet inside the satchel.");
					e.other:SummonItem(17180); --Field Satchel
				else
					e.self:Say("You do not seem to be skilled enough.");
				end
			end
		else
			e.self:Say("You do not seem experienced enough in the Planes.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 15985})) then --Imbued Breastplate
		e.self:Say("What a wonderful job! Councilman Taldarius shall wear this on our next adventure, I am sure he will find it more protective than his old one. Take this signet as a token of my gratitude. If you are not too busy I have another task, do you have any brewing skill?");
		e.other:QuestReward(e.self,0,0,0,0,16249); --Hardened Leather Signet
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 15993, item2 = 17179})) then --Portable Drink and Portable Drink Barrel
		e.self:Emote("gulps down a Twice Brewed Constitutional and burps loudly! 'Ahhhh that was refreshing! That should hold me over for quite some time. I see you are quite deft of hand, perhaps you would care to put your jewel craft skills to the test?'");
		e.other:QuestReward(e.self,0,0,0,0,16250); --Clay Signet
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 15991})) then --Velium Blue Diamond Ring
		e.self:Emote("grins. 'Quite a nice ring you have made for me " .. e.other:GetName() .. ". May it serve me as well as my old ring. Here take this signet. We seem to be finishing the tasks on my list at a nice pace. Tell me when you are ready to use some clay.");
		e.other:QuestReward(e.self,0,0,0,0,16251); --Wooden Signet
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 16246})) then --Filled Sacred Urn
		e.self:Say("Outstanding work " .. e.other:GetName() .. "! I can feel the purity of the water radiating through the clay. Are ye skilled with the needle as well as an accomplished potter?");
		e.other:QuestReward(e.self,0,0,0,0,16252); --Metal Signet
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 15986})) then --Fire Undergarment Tunic
		e.self:Say("Good work " .. e.other:GetName() .. ". This will definitely serve Councilman Taldarius well. Here take this! If you have skills with a fletching knife I may have a job for you to do.");
		e.other:QuestReward(e.self,0,0,0,0,1079); --Marked Signet
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 16247})) then --Signet Featherwood Bow
		e.self:Say("Masterful work " .. e.other:GetName() .. "! I can see your skill in the curves of the bow. Take this as a sign of my respect for your skill. The last item I need before we can be off is some food. I warn you this will truly test your skills. Do you fancy yourself a master chef?");
		e.other:QuestReward(e.self,0,0,0,0,16254); --Runed Signet
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 16248})) then --Food Satchel
		e.self:Say("Truly amazing! Now the Councilman and I can be off on our expedition to the Elemental Planes!' He takes out a tool and marks his signet before handing it to you, 'Before we depart you may want to ask the Councilman about the signet.");
		e.other:QuestReward(e.self,0,0,0,0,16256); --Marked Runed Signet
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
