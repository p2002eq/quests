-- Gwen Lonnes for mnk/rog/war/ber item quest in Gunthak

-- say block
function event_say(e)
    if(e.other:GetClass() == 1 or e.other:GetClass() == 7 or e.other:GetClass() == 9 or e.other:GetClass() == 16) then -- War, Mnk, Rog, Ber
        if(e.message:findi("Hail")) then
            e.self:Emote("swirls her leg around and nearly takes your head off with a powerful roundhouse kick. Apparently she doesn't like to be surprised while practicing her forms. 'What is it whelp, I have little time to waste speaking to weaklings. I must be in top form if I am to do battle with the pirates of Broken Skull, not to mention their fishy friends the [" .. eq.say_link("What are the Luggalds?", false, "Luggalds") .. "].' She then turns back to her forms.");
        elseif(e.message:findi("Luggalds")) then
            e.self:Emote("whips her arm around and slashes it towards your face. It stops a mere inch squarely in front of your nose. 'You obviously just got off the boat, " .. e.other:GetCleanName() .. ". Anyone who's been here more then a day knows about the Luggalds. Rumors say they are the new children of Innoruuk, created to serve their dark master in the aqueous lands of Norrath. Even now they sit in their caves deep within Broken Skull, weaving their magics and making plans to gather more relics of the old age. Few have seen what lies under their dark robes and lived to tell about it. Indeed the [" .. eq.say_link("What of the robes?", false, "robes") .. "] seem to have some sort of dark enchantment on them.'");
        elseif(e.message:findi("robes")) then
            e.self:Say("The dark cloth that the Luggalds wear is made with some manner of enchantment. It allows them much of the same protection that normally requires heavy armor. I hope to take a robe from one of them and possibly use it against them, but they are very cunning and have so far eluded me on my journeys on to the island. So far the only thing I've discovered that will cut though this odd fabric is glass. If I had some sections of robe and a glass shard, I might be able to fashion the robe into something quite useful.");
        elseif(e.message:findi("other things") and eq.get_qglobals(e.self,e.other)["relics_of_the_luggalds"] == 1) then
            e.self:Say("The Broken Skull clan has long used a special type of ink in their tattooing which is said to give them power in combat. I am curious to study the qualities of this ink. I have also seen several of the Shaman carry dark ore stones from time to time. I suspect that I may be able to tie the ink to the stone and hang it from that necklace I gave you to create a powerful amulet. Bring me a stone, ink and your dark cord and we shall see if the rumor of their power is true.");
        end
    else
        e.self:Emote("glances at you for a moment, then sneers and turns back around. 'Go away whelp, before I decide to use you for a sparring dummy.'");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359055, item2 = 359056})) then -- Torn Luggald Robe, Sharp Glass Shard
        e.self:Emote("stops her practice cold as you show her the torn robe. She seems to be fairly impressed, but her words convey a different message. 'Where did you get this? You're trying to tell me you took it from a Luggald yourself? What, did you find one on a rotting corpse somewhere? Bah, whatever the method it is still somewhat useful. Not exactly a prime specimen, but it will do.' She takes the glass shard and begins to cut long sections of fabric from the robe. She takes several strands and begins to weave them into a sort of braid. She hands it to you when she's made a sizeable length of cord.");
        e.self:Say("Here, place this around your neck and it should offer you some small bit of protection. As long as you're interested in scavenging, you might try to find a few [" .. eq.say_link("What other things?", false, "other things") .. "] for me as well.");
        eq.set_global("relics_of_the_luggalds",1,0,"F");
        e.other:QuestReward(e.self,0,0,0,0,359057,175000); -- Dark Cord of Broken Skull

    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359057, item2 = 359058, item3 = 359059}) and eq.get_qglobals(e.self,e.other)["relics_of_the_luggalds"] == 1) then -- Jar of Broken Skill Clain Ink, Dark Ore Amulet, Dark Cord of Broken Skull
        e.self:Emote("takes the stone from you and dips her finger in the jar of ink. She then begins to mark runes all across the surface of the stone. She then takes the stone and hangs it from your dark cord and hands it back to you. 'I find it hard to believe you managed to do this " .. e.other:GetCleanName() .. ", but I have kept my promise. I have either vastly overestimated the Luggalds or I have considerably understestimated you.");
        eq.delete_global("relics_of_the_luggalds");
        e.other:QuestReward(e.self,0,0,0,0,359060,500000); -- Amulet of Dark Waters
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
