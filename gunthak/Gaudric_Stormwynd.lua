-- Gaudric Stormwynd for Ranger spell quests in Gunthak

function event_say(e)
    if(e.other:GetClass() == 4) then -- Ranger
        if(e.message:findi("Hail")) then
            e.self:Say("Greeting. What brings you to this forsaken rock? I have been sent here by the council of Surefall Glade to gather information about this Island. This place seethes with anger and hatred, and even the familiar [" .. eq.say_link("winds") .. "] of Karana blow with a cold bite. So far the creatures have all proved very hostile, even to a follow of Karana. I suspect that the curse of Innoruuk has caused them be very aggressive towards all outsiders. I have been able to gather some information on a new race of [" .. eq.say_link("insect") .. "] though.");
        elseif(e.message:findi("winds")) then
            e.self:Say("The fury of a truly torrential storm is a beautiful thing. Even in their destruction they bring the birth of new life. Such is the cycle of life on Norrath, from the ashes nature always rebuilds. The trolls care nothing for this cycle though, and merely use the power of the storm to fill their treasuries. I hear the tormented cries of tempest [" .. eq.say_link("spirits") .. "] across the wind.");
        elseif(e.message:findi("spirits")) then
            e.self:Say("I believe the followers of Nadox have found a way to control the spirits of the tempest by capturing them in amulets made of the black rock from the island. Bring me one of their amulets and I may be able to free the spirit from it.");
        elseif(e.message:findi("insect")) then
            e.self:Say("A strange group of ant like creatures that I've named Nifiliks seems to be native to the island. I've never encountered creatures quite like this. They seem to have a sort of Hive consciousness. They have a vast range in size. The smallest are barely an inch or two across, while the largest can be upwards of four feet tall. The larger ones seem to be able to control the smaller ones by some sort of audible communication. I've heard the strange noises they make, but have yet to [" .. eq.say_link("mimic") .. "] them.");
        elseif(e.message:findi("mimic")) then
            e.self:Say("The smallest ones do not seem to have as developed of a nervous system as the larger ones. They only act on the instincts and the commands of their masters. If we're able to mimic the sounds that they make, we may be able to control the smaller ones. If you're able to capture one of them alive and allow me to listen to its sounds I may be able to mimic them. You'll also need to bring me one of the smaller ones so I can observe its reactions.");
        end
    else
        e.self:Emote("motions for silence. 'Can you hear it?  The sound of nature crying out in pain. The children of Karana long for a release from this place of torment.' Gaudric turns away and appears to begin meditating.");
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(e.other:GetClass() == 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 359038, item2 = 359039})) then -- Captured Nifilik and Tiny Nifilik
        e.self:Emote("takes the small nifilik and places it on the ground at his feet. He then partially unties the larger one causing it to let out some sort of high-pitched wailing. The small niflik on the table immediately begins to run across the ground toward you. You try to jump away but the nifilik still manages to latch onto your boot and crawl up under your armor. You howl in pain as the tiny creature bites repeatedly at your skin. Gaudric rebinds the larger nifilik and it stops wailing. The tiny creature below your armor stops biting at your skin.");
        e.self:Emote("begins to scrawl several runes on a parchment and then hands it to you. 'I believe I've worked it out now. Unfortunately, our voices won't be able to make the sounds necessary to control these creatures, but with the help of Karana's magic you'll be able to imitate the sounds enough to control the small creatures. Use their power wisely, Ninlawen. As you know their bite is quite painful.");
        e.other:QuestReward(e.self,0,0,0,0,359007,eq.ExpHelper(44)); -- Spell: Swarm of Pain
    
    elseif(e.other:GetClass() == 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 359040})) then -- Glowing Zraxthril Amulet
        e.self:Emote("takes the amulet from your hands and holds it in front of his eyes. He begins to speak arcane words into the stone, holding his other hand under the amulet. The amulet begins to spasm around crazily on its cord as if some creature was trying to escape from it. Sweat begins to bead up at Gaudric's brow. Suddenly the amulet explodes with light and Gadric is thrown to the ground. You reach down and carefully pick the amulet from the ground. You notice a large crack across the face. A watery visage begins to rise from the crack and take shape before you. The tempest spirit coalesces into a vaguely humanoid form and motions toward you. He points directly to the amulet in your hands.");
        e.other:SummonItem(359041); -- Cracked Zraxthril Amulet
        eq.unique_spawn(224340,0,0,-152,1583,3,0); -- #A_Tempest_Spirit
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end
