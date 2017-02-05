---- Quest:Fungus Covered Mushrooms
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Don't be bothered by that crazy gnome. He won't hurt you. He's just a little out of it today. I'm sure if he had some [mushrooms] it'd calm him down.");
    elseif(e.message:findi("mushrooms")) then
        e.self:Say("Reiker and his brother are always looking for fungus covered shrooms. They love to mix it into their stew. I must admit, it is very tasty.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end