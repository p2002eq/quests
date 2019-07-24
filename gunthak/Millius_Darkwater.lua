-- Milius Darkwater for Cleric and Paladin spell quests in Gunthak

-- say block
function event_say(e)

    if(e.other:GetClass() == 2 or e.other:GetClass() == 3) then -- Cleric, Paladin
        if(e.message:findi("Hail")) then
            e.self:Emote("lifts his sword out of the water at his feet and scans his eyes across you. 'Hello, " .. e.other:GetName() .. ". The waters stir angrily today. Prexus is not pleased at the tarnishing of his waters by the spawn of Innoruuk. The Deepwater Knights have been trying to locate this [" .. eq.say_link("What place?", false, "place") .. "] for many years.'");
        elseif(e.message:findi("place")) then
            e.self:Say("The legends of Broken Skull Rock have been whispered for years. Indeed several of our greatest vessels were lost while in search of this island. Many of our [" .. eq.say_link("What knights?", false, "knights") .. "] died trying to clease Prexus' waters of this great Evil.");
        elseif(e.message:findi("knights")) then
            e.self:Say("Most recently a Cavalier named Chester Steelblade went in search of the legend. He was gone at sea for months before we recieved word from him. The letter we received spoke of a map that he'd found as well as a somewhat cryptic reference to having found the [" .. eq.say_link("What key?", false, "key") .. "] to Broken Skull Rock. One of our [" .. eq.say_link("What clerics?", false, "clerics") .. "] took a small group out in search of him, but we have received no news from either group.");
        elseif(e.message:findi("clerics")) then
            e.self:Say("The cleric that went in search of Chester's crew is called Alina Crystalia and she was barely more than a student when she left. We didn't want to let her go, but ultimately we had little say in the matter. She was always very fond of Chester. She may have in fact found him, although I suspect too late to save either of them. Clerics of Prexus are required to carry with them a Deepwater Emblem to identify them, if nothing else I hope to find Alina's Emblem to return it to Erudin.");
        elseif(e.message:findi("key")) then
            e.self:Say("He didn't give any more information about the key, but we're sure that he must have found something that led him here. We have found no sign of him or his crew yet. Truthfully it would be a miracle if he were still alive. I follow his path in hopes that I can continue his work where he left off. If he is dead then his spirit may yet linger here. Tied to this world by his unfinished task.");
        end
    else
        e.self:Emote("looks somewhat startled as you approach him. 'Oh hello, " .. e.other:GetName() .. ". The tides of Prexus shift angrily these days.  Be careful as you explore the island, this is a most accursed place.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(e.other:GetClass() == 3 and item_lib.check_turn_in(e.self, e.trade, {item1 = 359026})) then -- Black Medallion
        e.self:Say("Taken form one of the pirates you said? Interesting. This medallion does seem to resemble what Chester described in his last letter to Erudin. I can sense the spirit of one of our order nearby. It is in terrible torment, I suspect Chester's spirit has been bound here by the dark curse of Innoruuk. You must find him and set him free. If you find him, show him this necklace to remind him of this unfinished errand. Perhaps he can help you complete what he could not do alone.");
        eq.set_global("Millius_Paladin", "1", 1, "F");
        e.other:SummonItem(359027); -- Black Skull Necklace

    elseif(ie.other:GetClass() == 2 and item_lib.check_turn_in(e.self, e.trade, {item1 = 359029})) then -- Deepwater Emblem
        e.self:Emote("bows his head quietly as his eyes bring recognition to his mind. 'Alina at least has met a bitter end. Her spirit surely lingers nearby. Find her and free her from her burden, " .. e.other:GetName() .. ". Her quest goes unfinished.'");
        e.other:SummonItem(359030); -- Alina's emblem
        eq.set_global("Millius_Cleric", "1", 1, "F");

    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359028})) then -- Glowing Black Skull Necklace
        e.self:Emote("takes the necklace from you and inspects it carefully. 'Thank you for rescuing this man, " .. e.other:GetName() .. ". Unfortunately, he was not Chester,but one of his companions. I fear that Chester may be lost even deeper in this accursed place.' He traces a few runes on the amulet and hands it back to you. 'Continue your search, Chester's spirit is still out there.'");
        e.other:SummonItem(359028); -- Glowing Black Skull Necklace - it really seems like this should be a different item...
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end
