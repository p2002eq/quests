---- Quest:Assassins in Katta & Saumeem's Assistance
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Hail " .. e.other:GetName() .. ", it is a pleasure to meet you. As the Governor of Defense for Katta Castellum it is my duty to ensure the safety of the city from outside enemies. At present the most imminent threat to the safety of our citizens is the Coterie of the Eternal Night and their [" .. eq.say_link("assassins") .. "]. There are other matters of defense as well however that you may be of [" .. eq.say_link("assistance") .. "] in dealing with.");
    elseif(e.message:findi("assassins")) then
        e.self:Say("The Coterie of the Eternal Night has trained several of their members to infiltrate the defenses of Katta Castellum and capture or kill citizens of our great city. Few of these assassins are successful at breaching the gate but the ones that do succeed tend to hide in shadowy corners waiting for an opportune moment to emerge and attack their victims. Should you discover one of these undead assassins slay it immediately. Kill four such assassins and deliver their Coterie Assassin [" .. eq.say_link("Garrotes") .. "] to me and you shall by honored by the Validus Custodus.");
    elseif(e.message:findi("Garrotes")) then
        e.self:Say("I require four of the Coterie Assassin Garottes in order to grant you the honor you strive for.");
    elseif(e.message:findi("coterie infiltrators")) then
        e.self:Say("They are undead Illusionists capable of disguising themselves as mortals. The signs of an infiltrator are often difficult to spot but should you identify an infiltrator within the city and slay it, bring me the creatures fangs, a Gem of Condensed Flame and your Reflective Claymore and I shall bestow upon you a greater reward.");
    elseif(e.message:findi("assistance")) then
        e.self:Say("Ah... Im glad that you have asked. There is a special matter that may benefit from your skills as an adventurer. I would love to explain the matter in full detail, but Im afraid that I am not your best source of information at this juncture. The matter was delegated to Kellari Autumnfall. Seek her out and see if she requires your assistance. She is looking into a matter of grave importance. Tell her that I sent you, should she ask. Be well and good luck with it.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31799, item2 = 31799, item3 = 31799, item4 = 31799})) then -- 4x Coterie Assassin Garrote
        e.self:Say("'I see you have met with success " .. e.other:GetName() .. "! You have earned the respect of Validus Custodus. Please take this as a symbol of our gratitude and your bravery. You are ganing notoriety with the Coterie, be wary of the [" .. eq.say_link("Coterie Infiltrators") .. "].");
        e.other:Faction(168,2); -- Katta Castellum Citizens
        e.other:Faction(350,10); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,31829,5000); -- Reflective Combine Claymore
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31832, item2 = 31832, item3 = 31831, item4 = 31829})) then -- 2x Vampyre Infiltrator Fang, Gem of Condensed Flame & Reflective Combine Claymore
        e.self:Say("Congratulations " .. e.other:GetName() .. "! You have done great deeds for the Validus Custodus and the safety of Katta Castellum. I award you with Ashbringer, a weapon wielded in the past by some of the Validus Custodus most fervent undead slayers. May it pass into good hands and may it continue to turn the undead to ash and dust.");
        e.other:Faction(168,2); -- Katta Castellum Citizens
        e.other:Faction(350,10); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,31830,5000); -- Ashbringer
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3873})) then -- Colains Head
        e.self:Say("It is very unfortunate that you had to be exposed to such corruption. Please, do not consider what you have seen during this situation to be the standard for our community. This was a rare occurrence. This situation did however allow you to prove yourself to us. We thank you for your bravery and selfless action in this matter. May you be followed by favor and may this small gift from my fellow governors and me assist you in your journeys.");
        e.other:Faction(168,2); -- Katta Castellum Citizens
        e.other:Faction(350,10); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,3875,5000); -- Elaborately Gilded Wooden Spear
    end
    item_lib.return_items(e.self, e.other, e.trade)
end