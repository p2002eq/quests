---- Quest:Vampyre Troubles
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Well met brave " .. e.other:Race() .. ". I am Lathin Firetree, Governor of Wizardry here at the Magus Conlegium. I have an abundance of research and experimentation to attend to so unless you have an issue of importance to present or are going to assist me with the research I must get back to my studies.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7270, item2 = 7169})) then -- Instructions for Lathin Firetree & Autarkic Shade Lord Belt
        e.self:Say("Phenic wishes me to summon the Shade that is the owner of this belt for questioning. That is quite a dangerous request but it is not uncommon of Phenic to be a risk taker when it comes to his plots against the Coterie of the Eternal Night. Take this sketch and find a skilled potter to craft you a likeness of a shade from a large block of clay as a focus item for the ritual. When you have the unfired figurine fire it in a kiln with this special glaze on a High Quality Firing Sheet and return to me.");
        e.other:Faction(206,5); -- Magus Conlegium
        e.other:Faction(168,5); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(284,-5); -- Seru
        e.other:Faction(139,-5); -- Hand of Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-5); -- Hand Legionnaries
        e.other:SummonItem(7271); -- Shade Figurine Sketch
        e.other:QuestReward(e.self,0,0,0,0,7272,10000); -- Conlegium Enchanted Glaze
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 7273})) then -- Shade Summoning Figurine
    e.self:Say("Excellent, this figurine will work wonderfully. A group of my best summoners is gathering on the first floor at the largest of the summoning circles to call forth the shade. Please take the figurine to Theurgus Ajeea Polaja immediately.");
        e.other:Faction(206,5); -- Magus Conlegium
        e.other:Faction(168,5); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(284,-5); -- Seru
        e.other:Faction(139,-5); -- Hand of Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-5); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,7779,10000); -- Shade Summoning Figurine (#2)
        eq.spawn2(160485,0,0,-75,-807,8,328.0); -- #Theurgus_Ajeea_Polaja
        eq.spawn2(160483,0,0,-120,-808,8,176.0); -- #Praecantor_Sels_Dawneyes
        eq.spawn2(160.0484,0,0,-97,-858,8,0); -- #Incantator_Jak_Masric
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
