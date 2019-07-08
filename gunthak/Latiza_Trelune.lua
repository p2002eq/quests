-- Latiza Trelune for Leviathan Eyes quest in Gunthak

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("eyes you coolly, taking particular interest in the shining pieces of your array. 'Yes, " .. e.other:GetCleanName() .. "? Is there something in particular that you were looking for?'. She chuckles. 'Do not be taken aback that I know your name. People of my kind have always been a bit more observant than yours.'");
    elseif(e.message:findi("scale")) then
        e.self:Say("If you are looking for one of my beautiful shining scales, bring me something equally beautiful! Bring me a blue flower, we do not have many of those in the sea and I would love to have one for my hair.");  -- made up dialog to help with quest
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 354005})) then -- Blue Lotus Petal
        e.self:Emote("looks delighted and tucks the petal into a lock of her hair. 'How lovely! Here then, a scale you shall have. Do not be surprised if nothing comes of it, but I do thank you for the gift. Best of luck to you, dear mortal.'");
        e.other:SummonItem(354004); -- Shiny Mermaid Scale
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
