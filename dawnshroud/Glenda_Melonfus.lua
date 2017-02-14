function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello there " .. e.other:GetName() .. ". Did [Kanthek] send you to me?");
    elseif(e.message:findi("kanthek")) then
        e.self:Say("Ahh. so you're interested in the Galorians then? Good to hear. The Galorians seem to be at war with the [Dawnhoppers]. The Galorians are known as the Sambata Tribe. I heard that they once lived in the caves behind us. but that all changed when the Dawnhoppers grew in numbers.");
    elseif(e.message:findi("Dawnhoppers")) then
        e.self:Say("The Dawnhoppers are the rockhoppers who inhabited Dawnshroud. They are a cruel bunch of hoppers. I swear. if I didn't know any better I'd think that the hoppers were out to kill every last galorian they encountered. They don't like 'em very much.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end