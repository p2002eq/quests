---- Quest:Vampyre Fangs
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("I am Governor Kroldar Strongarm of Katta Castellum. It is my duty to command the Validus Custodus in matters of Warfare. The Empire of the Loyalist Combine is currently engaged in a long lasting war with the Inquisition Combine of Sanctus Seru and the vile undead of the [Coterie of the Eternal Night].");
    elseif(e.message:findi("coterie of the eternal night")) then
        e.self:Say("The Coterie of the Eternal Night are not an enemy to be taken lightly. Our vampyre hunters must be dedicated to the annihilation of the undead. These vampyres tend to hold grudges that may last several of our lifetimes and their twisted vengeance may be inflicted on your descendents unless every one of the twisted abominations is destroyed. Should you bring me the fangs of four vampyres I will know you have taken the first step and are dedicated to the cause.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2691, item2 = 2691, item3 = 2691, item4 = 2691})) then -- 4x Vampyre Fang
        e.self:Emote("You have dedicated yourself to the war with the Coterie of the Eternal Night. I will continue to reward you for the fangs of every four vampyres that you slay. Should you be ambitious and skilled enough to confront the coterie leaders and live I will respectfully grant you the honor that you deserve.");
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(168,1); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(139,-2); -- Hand of Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,31728,2500); -- Vial of Blessed Water
    end
    item_lib.return_items(e.self, e.other, e.trade)
end