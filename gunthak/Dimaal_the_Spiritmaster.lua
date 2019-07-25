-- Dimaal the Spiritmaster in Gunthak for Finger Bones event

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Ahh a visitor, I see? Welcome to the Cave of the Damned. I am the keeper of these caves, and I have been charged with holding the spiritual [" .. eq.say_link("What manifestations?", false, "manifestations") .. "] at bay. Many bloody battles have been fought on the shores of Gunthak, many more battles will be fought here.");
    elseif(e.message:findi("manifestations")) then
        e.self:Say("Most of the spirits that perish on the beach move on to the next world, though a few remain bound to their ships or comrades and remain on the shore. Every once in a great while, however, a spirit breaks its bond to the beach and is drawn to this cave. There is magic in this cave, dark magic. The spirits that find their way here draw power from the magic in the caves. I assure that the spirits that find their way here remain contained in the cave, along with their [" .. eq.say_link("What treasures?", false, "treasures") .. "].");
    elseif(e.message:findi("treasures")) then
        e.self:Say("I figured that would pique your interest. A few of the spirits here managed to retain a portion of their material possessions. If you wish, I can channel the spirits into a form where you may request their treasures. Of course, there is a [" .. eq.say_link("What is the price?", false, "price") .. "].");
    elseif(e.message:findi("price")) then
        e.self:Say("Finger bones. There is strong magic in the bones of our fingers, and I use such bones to summon the spirits, as well as keep them bound to this cave. Bring me four identical finger bones, the better condition the bones are in, the stronger the spirits I call will be.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 358007})) then -- Luggald Heart
        e.self:Emote("clenches her jaw as she wrenches a glimmering obsidian shard from between her scales. 'As promised, here is what you desired. What I wouldn't give to have them taste their own bitter magic.'");
        e.other:SummonItem(354008); -- Fragment of Dark Ice 
    end

    item_lib.return_items(e.self, e.other, e.trade)
end

-- event block
-- ...