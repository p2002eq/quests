---- Quest:The Gale Weaver
function event_say(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
    fac = e.other:GetFaction(e.self);
    if(fac == 1) then
        if(e.message:findi("hail")) then
            e.self:Say("Good day to you, " .. e.other:GetName() .. ". I am Annous Pineshadow, high priest of The Rainkeeper and ambassador of Qeynos. It has been a [long] time since I last set foot within the Jaggedpine, and although not surprised, I am amazed and awestruck at the untouched purity of these sacred grounds. It is very much a relief to know that the forest has been sparred the taint of the venomous world that has become Norrath.");
        elseif(e.message:findi("long")) then
            e.self:Say("Sixty years -- give or take. This is the place of my birth and my home. When I had come of age, I ventured to Qeynos to learn the ways of the priest, finding myself lost in the ways of the druid. I adore the nature that Karana sustains, but I had always felt myself more suited for the path of preservation and servitude of the faith. When his majesty, Antonious III sealed the Jaggedpine, I was among those who were asked to remain behind in Qeynos. Only the druids and rangers of Karana remained in the Jaggedpine -- it was important to preserve only the bare minimum and we understood the need. We also did not wish to have our culture be entirely cut off and those who remained outside of the forest's confines were there to continue the faith and [sacred ways] of The Rainkeeper.");
        elseif(e.message:findi("sacred ways")) then
            e.self:Say("There are hundreds of different rites, ceremonies, prayers, and rituals that are performed in one's devotion to The Rainkeeper. Many of these can be as simple as the performance of a duty, as a druid would protect their forest, while some may be as complex and consuming as a several day ceremony to usher in the changing seasons. Aaaah. . . but there is truly so much that in the time that's left for me here could not give proper justice for in my explanations -- nor do I believe that you would truly understand them by simply listening. You must [have the faith in your heart] and you must truly wish to uphold the ways of the Rainkeeper and do so to truly understand.");
        elseif(e.message:findi("heart")) then
            e.self:Say("I would not dare challenge that, my friend, but is your faith strong enough to withstand the greatest of consequences -- even the sacrifice of your own life in remaining true to that faith? Aaaah. . . but such is a question that cannot be merely asked and simply answered in words. One truly does not discover one's self until they are faces with the reality of such tests of faith. Perhaps, if [you are willing], I might guide you on a path that may lead to the discovery of such answers.");
        elseif(e.message:findi("willing")) then
            e.self:Say("Excellent, child. I am pleased to know that you are willing to go so far as to test your faith -- but do so not to me, or to anyone other than yourself and The Rainkeeper, else you shall find only a hollow shadow of the answers you seek, and a great void of disappointment. If you prove successful in your own eyes by completing this task, then you shall be among The Rainkeeper's sacred order of priests -- The Gale Weavers. Druids and Clerics alike make up this order, for our dedication is mutual in strength and our ultimate duties to The Rainkeeper are parallel. The first journey that you must embark on will result in the acquisition of the [Azure Idol of Karana] -- an ancient item that each of The Gale Weavers possess.");
        elseif(e.message:findi("karana")) then
            e.self:Say("When the order was first founded by the Hierophant known as Tanirun Galeweaver, he bestowed upon all of his brethren a sacred idol carved by his own hands. It is said that when Tanirun blessed the Shrine of Karana with his gift of the storm, that the remaining essence of Karana's witness was divided among the idols. In the passing times, the idols were handed down when an old member passed beyond into the Eye of Karana's Storm and a new member was inducted in their predecessor's memory and honor. You will seek one of these idols -- one that at present has no owner and was stolen by the bandit raiders and return it to me. The man who possesses the idol is one known as Drayen Blackguard -- a member of the dreaded Blackguard family that has taken recent residence in the forest. You shall find him in the mountains of Rathe if our scouts are correct.");
        elseif(tonumber(qglobals.galeweaver) == 1) then
            if(e.message:findi("prove myself worthy")) then
                e.self:Say("Then your endeavor shall continue, my child. Take this scroll -- to you now it holds no meaning but in due time you shall understand. Keep the scroll close to you until you have sought and successfully acquired the [Dormant Crystal Sphere] and [The Rainkeeper's Writ].");
                e.other:SummonItem(8962); -- Ancient White Scroll
            elseif(e.message:findi("dormant crystal sphere")) then
                e.self:Say("There are several magical spheres throughout Norrath but this sphere is [unique to The Rainkeeper]. It is said that when Karana blessed this area with his first storm in acceptance of the nomadic tribe that would settle here, that the droplets of rain left upon the pines and blades of grass was gathered by one of these nomads and stored in a plain clay jar that was then buried as a symbol of their own gratitude toward the storm. Nearly a century later when Karana's Shrine and the Throne of Karana's Thunder were near completion, one known as Tanirun Galeweaver found the jar. The water was still inside, preserved by means unexplainable through simple reason. It is said that Tanirun poured the water into his own hands and wove a spell, sealing the wind within the orb of this ancient rain that was now crystallized by Tanirun's spell.");
            elseif(e.message:findi("unique to the rainkeeper")) then
                e.self:Say("Tanirun's orb was used to make the first symbol that to this day is wielded by the members of the sacred order. His effects were duplicated by the first order and each bore an orb identical to Tanirun's. These orbs, as the idols, were passed down from member to member. As with the idol, we held an orb that had no bearer. However, before the Jaggedpine was sealed, the orb disappeared. We are not certain as to how or why, but we do know that if it lies within the hands of one who is not of Karana's faithful priests, it shall become dormant until awoken. I have heard rumors, distant whispers upon the wind and storm that the orb lies within the depths of Solusek's Eye -- nestled in the hands of a giant known as Neiroth the Tyrant. Find this ancient giant and retrieve the orb from him.");
            elseif(e.message:findi("writ")) then
                e.self:Say("When the order of The Gale Weavers was established, Tanirun and his brethren of the order constructed a sacred writ similar to a spell, but it cannot be invoked at the priest's whim. Like the storm, it is chaos. When the words are spoken, the elements of the storm will come as they wish, when they wish. This writ was used to conjure the essence of the storm into the orbs, creating the mirror of a sky where a storm rages eternally. The writ was lost to us sometime before the Jaggedpine was sealed. One known as Naundruar, a former high priest of our order, took the writ. He was furious, enraged that the order had been asked to divide and leave our sacred homeland. None are ultimately certain what horrible fate befell him, for his hatred toward Qeynos had infected his being like an incurable disease. In the southern plain of Karana you will find the remnants of this once great priest and with him, you shall find the writ.");
            end
        end
    end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
    fac = e.other:GetFaction(e.self);
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8956}) and fac == 1) then -- Azure Idol of Karana
        e.self:Say("Marvelously done, my friend. The idol's return by your hand bodes well indeed toward the success of your quest. Now, it shall remain without a hand to possess it -- but in time, perhaps, it may find a suitable possessor in you. If [you wish to prove yourself worthy] of the idol and further prove your faith as notable enough to belong to the sacred order of The Gale Weavers, then speak your pledge and your test shall continue.");
        e.other:Faction(271,10); -- Residents of Jaggedpine
        e.other:Faction(159,5); -- Jaggedpine Treefolk
        e.other:Faction(265,5); -- Protectors of Pine
        e.other:Faction(135,1); -- Guards of Qeynos
        eq.set_global("galeweaver","1",0,"F"); -- Globals
        e.other:QuestReward(e.self,0,0,0,0,17135,10000); -- Dormant Gale Stone
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8964,item2 = 8963,item3 = 8962}) and tonumber(qglobals.galeweaver) == 1) then -- The Rainkeepers Writ, Dormant Crystal Sphere & Ancient White Scroll
        e.self:Say("You have done well, my child. The ancient scroll has impressed upon it a small mirror of your faith. As it was with you through your travels, the runes have changed to reflect your own heart and what lies within it. I have woven for you the Orb of the Gale -- your Orb of the Gale, but do not think that your journey ends here. It is still hollow -- the winds are dormant and the clouds lie in wait. Their lifeblood is missing, and you must seek it. To do this, you must venture to the realm where the Gale thrives -- the Plane of Sky. There are ethereal creatures known as Gale Weavers that dwell there. You must extinguish their temporary tangible form and from that, take the essence of the Gale that they have woven. Do not feel remorse for destroying these planar creatures, for you do not truly destroy them. Once you have obtained the Essence of the Gale, place it into the orb and seal it, creating the Orb of the Gale that must be returned to me.");
        e.other:Faction(271,10); -- Residents of Jaggedpine
        e.other:Faction(159,5); -- Jaggedpine Treefolk
        e.other:Faction(265,5); -- Protectors of Pine
        e.other:Faction(135,1); -- Guards of Qeynos
        eq.set_global("galeweaver","2",0,"F"); -- Globals
        e.other:QuestReward(e.self,0,0,0,0,17135,10000); -- Dormant Gale Stone
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8966}) and tonumber(qglobals.galeweaver) == 2) then -- Orb of the Gale
        e.self:Say("You astound me, my child. Well done indeed, and I am very pleased to know that you have been successful in these endeavors. It is an honor to bestow upon you this, our sacred symbol, and welcome you into the order of The Gale Weavers. Bear it proudly, but do not flaunt pride. Keep your sacred duties to The Rainkeeper first and foremost in your thoughts and actions -- the Gale Weaver shall guide you when you need guidance most, and it shall protect you when your time for failure has not yet come. The idol shall remain with me, where I shall bury it at the Shrine of Karana in honor of your coming into our ranks. When the time comes for you to pass beyond, it shall be unearthed by another who has taken my place as high priest of our order, for I will likely have passed into the Eye of Karana's Storm before your final day.");
        e.other:Faction(271,10); -- Residents of Jaggedpine
        e.other:Faction(159,5); -- Jaggedpine Treefolk
        e.other:Faction(265,5); -- Protectors of Pine
        e.other:Faction(135,1); -- Guards of Qeynos
        e.other:QuestReward(e.self,0,0,0,0,8967,10000); -- The Gale Weaver
    end
    item_lib.return_items(e.self, e.other, e.trade)
end