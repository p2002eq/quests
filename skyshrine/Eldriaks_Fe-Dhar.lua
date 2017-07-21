-- NPC:  Eldriaks_Fe'dhar
--zone:  Skyshrine

--Quest NPC for the Spirit of Garzicor Quest.  http://everquest.allakhazam.com/db/quest.html?quest=1277
--Players must be ALLY with Claws of Veeshan to receive quest dialog and progress

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if (e.other:GetFaction(e.self) == 1) then  	--check for ally faction to receive dialogue
		
		--Dialogue responses for 6.0 of Quest (After Hand-in of Dragon Crafted Urn from Oglard)
		if (qglobals["garzicor"] == "6") then
			if((e.message:findi("no") and e.message:findi("master smith")) or e.message:findi("I am not a master smith")) then
				e.self:Say("You must be the one to forge the weapon, " .. e.other:GetName() ..". Go and learn the art of the smith. Return only when you are a master and tell me you are ready. I will then tell you what must be done");
			elseif((e.message:findi("yes") and e.message:findi("master smith")) or e.message:findi("I am a master smith")) then
				e.self:Say("Good. The weapon is extremely complicated to construct, your skills will be tested perhaps beyond your abilities. The weapon is known as a Naginata. You need not be proficient in its use to build it. The Naginata is constructed of four major parts. [The shaft], [the blade], [the fittings], and [the hilt], or tsuba. No ordinary materials can hope to bind the dragons spirit. Special materials must be found.");
			elseif(e.message:findi("the shaft")) then
				e.self:Say("The shaft must be strong enough to withstand the effects of the spirit's presence, yet flexible enough to be wielded properly. Of the few dragons that returned to us from the Ring of Scale, some brought back knowledge of a type of wood that may be sufficient. It is known as bronzewood. One can find it amidst one of the forests on the continent of Kunark. I am sure it is being used by one of the sentient races there.");
			elseif(e.message:findi("the fittings")) then
				e.self:Say("The fittings are the most important part. The spirit itself will be held there partially. We'll discuss this later, when you have all the other pieces in your possesion.");
			elseif(e.message:findi("the hilt")) then
				e.self:Say("The Tsuba is where most of the enchantment will lie. It must be forged seperately of another ore created to be the bane of the dragon. It is called [chronium] and was developed by the Kromzek with the aid of their blood-thirsty @#%$. You must forge the ore into a plate and then find a [craftsman] with the skill to carve a detailed mandala of draconic binding into it. This mandala will hold arcane power and restrain the spirit from destroying the weapon.");
			elseif(e.message:findi("chronium")) then
				e.self:Say("Chronium is a sacred ore used only by the higher ranked priests of Rallos Zek. You may be able to find some in the city of the Kromzek, Kael Drakkel. Perhaps in one of their temples. Forging it into a plate is simple. Heat the ore in a forge and shape it with a Forging Hammer, then temper it with a Flask of Water. ");
			elseif(e.message:findi("the blade")) then
				e.self:Say("The blade will be the most difficult piece for you to build. First of all, no mundane ore will do. Long ago, Veeshan sent a gift to us in the form of a meteor. This meteor holds the ore you must build the blade with. Once you have the ore, follow the instructions in this book and forge the blade. Don't forget, when melting the ore, use the bone dust I gave you.");
			elseif(e.message:findi("craftsman")) then
				e.self:Say("Since the [mandala] is so detailed, only a craftsman trained specifically in these matters will do. I'm sure you're a fine smith but an adventurer like yourself wouldn't have time to fully master the skill needed to create the tsuba. Find one whose entire life is the art of creating these types of weapons. The craftsman will need a sketch of the mandala as well as the plate of chronium.");
			elseif(e.message:findi("mandala")) then
				e.self:Say("The type of mandala we need is a diagram laced with powerful arcane enchantment. You'll need to find a sketch of the correct mandala for the craftsman to go by as he carves it into the chronium plate. There is one [place] you may be able to find a sketch of a mandala powerful enough to bind Garzicor.");
			elseif(e.message:findi("place")) then
				e.self:Say("The ones that returned to us from the Ring of Scale told us of the Sarnak. These are hybrids of dragons and a sentient lizard race known as the Iksar. Whoever created them had to bind a dragon to his will or restrain it at some point. Perhaps this being or one of his brood still has a recording of the mandala. Once you have the Tsuba, Blade, and Shaft, return here and show them to me. I will then explain what must be done next.")
			end
		end
			
		--Step 7.0: Final Dialogue in Quest after receiving Assembled Naginata and Vial of Kromzek Blood
		if (qglobals["garzicor"] == "7") then
			if(e.message:findi("awaken garzicor's spirit")) then
				e.self:Say("First you must awaken his spirit by speaking where you found his corpse. You must say exactly this: 'You are one but two. Your vengeance shall find a home.' Hopefully this will bring him to you. You must hurry and splash the vial of Kromzek blood upon his ghostly form. The taste of the blood will bring him fully into existence. You must then do battle with him. If you defeat him, you will have split his being which will be represented by two more shades. Give them each a flawless diamond. He will comply and choose these gems as a phylactery. Once you have the dual phylactery, you need only combine them with the assembled naginata in a forge to create the Ethereal Bladed Naginata. Bring me the weapon.");
			end
		end
	end
end


function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	
	if (e.other:GetFaction(e.self) == 1) then  	--check for ally faction
	
		--Quest Trade Dialog for Step 6.0
		if (qglobals["garzicor"] == "5") then	--Checks for atleast 5.0 qglobal flag from Oglard
			if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2053})) then	--Check for Dragon Crafted Urn (2nd version)
				e.self:Say("Hmm? What's this? Oh! You are the " .. e.other:Race() .. " who has been helping us with the nameless one. Well, not so nameless anymore. A part of Garzicor clings to this world, eager to bring vengeance upon the giants who murdered him. We've decided a weapon must be constructed, and the restless spirit of Garzicor must be bound to it. You must be the one to construct this weapon. This dust must be used in the forging of the weapon's blade. Are you a [master smith] ".. e.other:GetName() .. "?"); 
				e.other:QuestReward(e.self,0,0,0,0,2054,300);	--Sanctified Bone Dust
				e.other:QuestReward(e.self,0,0,0,0,18282,0);	--"The Blade" (Book)
				eq.set_global("garzicor","6",5,"F"); -- Completed Garzicor Quest Part 6.0   
			end
		end

		--Quest Trade Dialog for Part 7.0
		if (qglobals["garzicor"] == "6") then
			if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1868, item2 = 2055, item3 = 2056})) then	--Check for Bronzewood Staff, Finished Tsuba and Finished Naginata Blade
				e.self:Emote("takes the staff, blade, and tsuba and looks them over. He says, 'Excellent craftsmanship. These will make a fine weapon. But one part remains to join all the pieces together. That is the fittings.' The wyvern then hands you the items back along with a vial of blood and says, 'This vial of blood will allow you to [awaken Garzicor's spirit]. ");
				e.other:QuestReward(e.self,0,0,0,0,2426,300);	--Assembled Naginata
				e.other:QuestReward(e.self,0,0,0,0,2063,0);		--Vial of Kromzek Blood
				eq.set_global("garzicor","7",5,"F"); -- Completed Garzicor Quest Part 7.0
			end
		end
			
		--Final Quest completion dialogue(no further qglobals)
		if (qglobals["garzicor"] == "7") then	
			if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1728})) then	--Check for Ethereal Bladed Naginata (V1)
				e.self:Say("You have succeeded, " .. e.other:GetName() ..". Garzicor's spirit no longer calls to us from beyond. Now we ask that you do one more thing. You must wield this weapon against all giant kind to satiate Garzicor's thirst for vengeance. The Naginata has a special power against the Kromzek, they will fall easily before it. However, if you do not wish to, hand the weapon back to me and I'll give you an earring more worthy of a being of faith. If you are one of sorcerous powers, hand me the earring and Ill hand you a ring more suited to you.");
				e.other:QuestReward(e.self,0,0,0,0,2097,500);	--Ethereal Bladed Naginata (V2)  Quest Reward Version
				eq.delete_global("garzicor");	--Signals Quest completion
			end
		end
		
		--Alternative Garzicor Quest Reward Options (does not require qglobal flag but does require ally faction.  This can only be done once.) 
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2097})) then 	--Trade in Ethereal Bladed Naginata (V2) for Sanctum Earring
			e.self:Say("Tis sad to see that the weapon will not be wielded by it's maker, but here is your earring. Wear it well.");
			e.other:QuestReward(e.self,0,0,0,0,2065,0);		--Sanctum Guardian's Earring
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2065})) then  --trades Sanctum Earring for Pitted Iron Ring (no more exchanges available)
			e.self:Say("So you prefer the ring? Very well, may it serve you well, " .. e.other:GetName() .. ".");
			e.other:QuestReward(e.self,0,0,0,0,2064,0);	--Pitted Iron RIng
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
