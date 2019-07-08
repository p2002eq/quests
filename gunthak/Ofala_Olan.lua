-- Ofala Olan for Enchanter spell quests in Gunthak

-- say block
function event_say(e)
    if(e.other:GetClass() == 14) then -- Enchanter
        if(e.message:findi("Hail")) then
            e.self:Say("Salutations! It is nice to see one such as you in these parts; I do get lonely for some intelligent conversation around here once in awhile. The majority of the time however, I am much too preoccupied [" .. eq.say_link("researching") .. "]. There are so many interesting things to discover in a new area!");
        elseif(e.message:findi("researching")) then
            e.self:Say("Many things actually. The very land of this island has interesting peculiarities due to the foreign plant life and substances the pirates have introduced into the ecology. I have been working most specifically on deciphering what portions of the strange materials may hold magical properties that could be useful to our work as Enchanters. Why, just the other day I believe I was on the verge of a great breakthrough with some odd substances I had mixed together, unfortunately I was careless and did not seal the vial tightly enough. When I awoke the next morning the [" .. eq.say_link("specimen") .. "] had completely evaporated.");
        elseif(e.message:findi("specimen")) then
            e.self:Say("Among some of the substances I was experimenting with, I began to notice some peculiar attributes. I noticed some of the dark priests taking cuttings from certain mushrooms, and began experimenting with that first. I discovered that they could be boiled into a salve that had the most wondrous properties for the eyes! (sighs) It will take me ages to get the [" .. eq.say_link("necessary components") .. "] back to pick up where I left off on that particular spell, not to mention the research that I am compiling for my [" .. eq.say_link("brother") .. "] to assist with his specialties. I have enough material here to keep me swamped for ages, those spells will just have to wait!");
        elseif(e.message:findi("necessary components")) then
            e.self:Say("Well, I believe that with two specific substances I can concoct a potion that will give certain effects for a specific amount of time. If I have these components I believe I have the understanding to capture the essence of them within a spell, so that the effects may be recalled at will. For this I would need the stalk of one of the local mushrooms, they secrete a fluid that is useful. I also need a mermaid scale from a mermaid here in the Gulf. Are you still willing to [" .. eq.say_link("assist") .. "] with this?");
        elseif(e.message:findi("assist")) then
            e.self:Say("Take this vial with you then to contain the items that I have requested. Once you have them trapped inside, blend them together by sealing the bottle and shaking gently. Then bring it to me and I will see what I can do about finishing the task. Should the mixture prove true and I unlock the secret of the potion, I will share it with you for your efforts. Be very careful however, as always in dealing with items that we are not yet fully familiar with, the materials may prove dangerous!");
            e.other:SummonItem(317889); -- A Dusty Glass Vial
        elseif(e.message:findi("brother")) then
            e.self:Say("My brother is also an accomplished enchanter by the name of Stofo Olan. He has been hard at work in Erudin researching for his teacher Jeb Lumsed. He has a keen sense for the properties of stone and other such solid objects. For some time now he has been attempting to harness the power of stone for use in some form of mind control, that could be activated through a piece of jewelry. Entirely by accident, it seems that such a substance has been in use on this island for some time. It is very dangerous however, and as such most of my work has been based in theories tossed back and forth between he and I. Are you interested in this [" .. eq.say_link("strange rock") .. "] as well?");
        elseif(e.message:findi("strange rock")) then
            e.self:Say("What a small world! I have skill with gem setting as many of our kind do, although I am afraid my specialties lie more with other types of elements and power. There have been stories of miners down in the Torgiran Mines losing their wits or becoming near zombie like in their actions. I have a hunch that whatever is doing this is being harvested there. Take good care down there, I fear that the miners themselves may not be too friendly. Travel into the mines and bring me two chunks of whatever the ore is that they are gathering, be sure it is of the type that glows brightly. Most likely the miners will have a few samples, but their masters probably have a few as well. Bring these to me with an enchanted bar of gold and I can fashion a test ring from it. Be careful!");
        end
    else
        e.self:Emote("glances up from the book she is reading and looks you over. 'If you are looking for the... Ahem... Library, it is the building to my right.  Now if you'll excuse me I have some reading to do.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 354025}) and e.other:GetClass() == 14) then -- Swirling Vial
        e.self:Emote("takes the vial gently from your hands and begins murmuring quietly. Thick incense smoke moves lazily through the air as she works, curling about and hanging onto your clothing. The strange liquid inside the vial begins to glow a deep red and seemingly moves of its own volition. Ofala quickly smears a bit of the substance about her eyes and looks up at you. 'We have solved it! I believe I can recall this again, let me get this down for you now before the spell wears. Use it well.' Withdrawing a fine quill from a pouch at her waist, she dips the tip into the swirling potion and scrawls out the words of a spell onto parchment.");
        e.other:QuestReward(e.self,0,0,0,0,359015,150000); -- Spell: Leviathan Eyes, ~2% exp at lvl 44

    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 316506, item2 = 354006, item3 = 354006}) and e.other:GetClass() == 14 ) then -- Enchanted Gold Bar, 2x Gleaming Zraxthril Ores
        e.self:Emote("eyes you with a new measure of respect. 'Very well done! I did not think you would be successful in this. Let me harness this energy quickly then you must have Stofo take a look at it!' Being careful not to touch the gems too much with her bare hands, Ofala Olan deftly crafts a slim golden band, crossing strands of gold across the dimly pulsing stones to bind them in place and protect the wearer from harm. 'He still holes himself up in that dim room in Erudin. I don't know HOW he studies like that, but take it to him please! I am sure he will be most interested.'");
        e.other:SummonItem(354007); -- Note to Stofo
        e.other:SummonItem(354008); -- Dimly Glowing Ring
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
