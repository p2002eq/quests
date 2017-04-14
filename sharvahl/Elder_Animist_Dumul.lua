-- Elder_Animist_Dumul (155040) in Shar Vhal for BST epic

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if qglobals.bstepic ~= nil and tonumber(qglobals.bstepic) > 0 then
		if e.message:findi("ready") then
			e.self:Say("As you may have gathered during our first meeting, we have been dealing with a situation that differs from any that we have dealt with in the past. We dismissed the situation as improbable at first, but unfortunately we have just attained certain proof. Our scouts have found that an individual has discovered a means of manipulating elder spirits. These spirits have a great deal of power over their natural environments. This person has used some new magic to take that power for himself.");
		elseif e.message:findi("new magic") then
			e.self:Say("The scouts were able to witness some of the rituals used to capture the spirits. They described a process that involved the use of a wooden totem, shaped in the image of the spirit's true form. The magic-user is able to use that totem to siphon the power of the spirit. He then uses that power to transform the spirit into an entity of malign intent. Fortunately, our research has given us the name of this vile magic-user.");
		elseif e.message:findi("name") then
			e.self:Say("His name is Draz Nurakk. It appears that he has learned the ways of the Khati Sha to the point of mastery. His magic and will seem to defy even the darkest secular beliefs of his people. We harbor no ill will toward the Iksar, but this individual must be stopped. This leads us to your mission.");
		elseif e.message:findi("mission") then
			e.self:Say("We need you to meet our scouts and assist them in releasing the spirits that have already been affected by this magic. None of the scouts have reported in for some time, so you will need to find them. Once you find them, show them the seal that I gave you. They will help you to release the spirits and capture the totems. Please have the scouts help you to place the totems in the case that I gave you. If you lose the seal or damage it in combat, please return to me for another. Good luck, " .. e.other:GetName() .. ". You must succeed if we are to maintain the balance of the spiritual realm.");
		elseif e.message:findi("seal") then
			e.self:Say("Here you go.  Keep this one safe.");
			e.other:SummonItem(9031);
		end
	else
		if(e.message:findi("spiritual") ) then
		e.self:Say("Well, my prying little friend. Someone as inquisitive as you may be of use to us. Perhaps you were sent to us by the very ones we seek to help. The spirits are capable of far more impressive manipulations. If any time warrants such trickery or nudging of fate, I would guess that this day would qualify. Be aware of one thing, youth... the beastlord that follows the path I see before us this day may not return to this house unscathed... if they return to me at all. If you are the Khati Sha I seek, prove your worth in combat and return to me with the Copper Medal of War. You can get this medal from assisting the soldiers in the Grimling Forest.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9061})) then -- Collection of Spirit Lore
		e.self:Say("Thank you, young courier. I will not need anything more from you at this time. We have a great deal of research to do and absolutely no time to complete said studies. Did the Historian tell you anything? Matters are bad enough without rumors floating about in the shadows. Speak up... did you hear anything about our situation?");
	
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4393})) then -- Copper Medal of War
		if e.other:GetClass() == 15 then
			e.self:Say("You have returned at a most opportune time, " .. e.other:GetName() .. ". If this medal is indicative of your abilities in combat, I may be able to find a slight amount of hope soon. We have learned answers for many of the questions that we had prior to your last visit. Please take this seal and this container. Place them somewhere safe, while I gather the information that we've accumulated so far. Let me know when you have the seal packed and are [ready to be briefed]. Should you ever lose it, just ask for another.");
			e.other:SummonItem(17361);
			e.other:QuestReward(e.self,0,0,0,0,9031); -- Official Seal of the Khati Sha
			eq.set_global("bstepic","1",5,"F"); -- bstepic 1 indicates totems started
		else
			e.self:Say("Thank you, " .. e.other:GetName() .. ". Your bravery in combat is noted, but you lack an understanding of the spirits. I cannot trust you with matters of the Khati Sha.")
		end
	
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9044})) then -- Sealed Box of Totems (result of quest with scouts)
		e.self:Say("I have received word from several of our scouts indicating your impending arrival. We are all very pleased that you were able to release all of the spirits before any true harm could manifest itself. Your efforts have not only restored balance to the spirit realm, they seem to have also acted to hinder any other plans our antagonist may have had... for the time being.");
		e.self:Say("Our Taruun scouts have discovered Draz Nurakk's location. A scout has returned from a set of islands on the Old World. The islands are in a place called Timorous. The Taruun returned while leaving a scout behind to insure that the foul Animist does not evade us any further. You will need to find the island on which our scout has set up camp. The island has a great statue on it. Hopefully, he will still be in that location. Show him this seal and he will know that I sent you to assist.");
		e.other:QuestReward(e.self,0,0,0,0,9045); -- Seal of Elder Dumul
		eq.set_global("bstepic","2",5,"F"); -- bstepic 2 indicates totems completed
	
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9048})) then -- Sack of Broken Glass (approved version)
		e.self:Say("My fears were well founded, and I am glad that I have had people that are able to understand those fears. Please do not think that I have intentionally placed you in the path of harm, but I did have my suspicions about our adversary's strength. I am not surprised that he was able to deceive us in this manner. I thank the spirits that you were able to evade harm in your completion of this task.");
		e.self:Say("Take this note to Arms Historian Qua. He has been researching a means of circumventing any protective magic that Draz Nurakk may have in place. When you meet him next, you will be well equipped to complete the restoration of balance to the spirit realm. Make your way to Qua and do as he says.");
		e.other:QuestReward(e.self,0,0,0,0,9049); -- Note for Historian Qua
	
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9055, item2 = 9056})) then -- Jagged Claws of Rending
		e.self:Say("These claws are exquisite. I can see that a great deal of thought went into their design. Now it is your turn to demonstrate your proficiency in your chosen role. You have a great challenge ahead of you, for we have determined that only these claws will work to harm this dark animist, this corrupter of spirits. You will need the support of your people; but in the end, only the strength of your will can save us.");
		e.self:Say("Our scouts have tracked Draz Nurakk to an abandoned village in the Fungus Grove. We learned of his intent to track you down. I take it that he did not appreciate your willingness to assist us. He knows who you are, so it will be best for us to get him before he can conjure up any more surprises. Find Scout Halmia in the Grove and give her this seal. Then bring the evidence of his destruction to me when you are done. Place his head, the seal, and those claws in this box and return it to me.");
		e.other:SummonItem(9055); -- returns Jagged Claw of Rending
		e.other:SummonItem(9056); -- returns Jagged Claw of Rending
		e.other:SummonItem(9057); -- Khati Sha Seal of War
		e.other:QuestReward(e.self,0,0,0,0,17362); -- Acrylia Gilded Box
	
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9060})) then -- Sealed Gilded Wooden Chest
		e.self:Emote("opens the container and looks at its contents");
		e.self:Say("" .. e.other:GetName() .. ", you have saved the balance of the spirit realm. Your selflessness has made an impression that will last well beyond the effects of your recent deeds. The inhabitants of this realm are all in your debt. Your efforts to restore balance in the material realm have been worth more than we can reward you for.");
		e.self:Shout("Citizens of Shar Vahl, please take the time to acknowledge the efforts of a true champion and hero to our people. " .. e.other:GetName() .. " has worked valiantly with great personal risk, to restore balance to our realm. We, the Khati Sha of Shar Vahl, feel that only a spirit as strong as " .. e.other:GetName() .. " can be entrusted with the Claws of the Savage Spirit. Please take this time to give " .. e.other:GetName() .. " your thanks and respect.");
		eq.zone_emote(1, "A glorious cheer rises from the streets of Shar Vahl to greet the city's newest hero.");
		e.other:SummonItem(8495); -- Claw of the Savage Spirit 1
		e.other:QuestReward(e.self,0,0,0,0,8496,10000000); -- Claw of the Savage Spirit 2 + big XP hit!
		qglobals["bstepic"] = nil;
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

