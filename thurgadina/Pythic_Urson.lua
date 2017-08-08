-- Captain Nalot's Triple Strength Rum
function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30060, item2 = 30058})) then -- Bladder of Acidic Ooze and Fresh Tree Sap
        e.self:Emote("laughs at you and then takes the sap and bladder. He mixes the two together and then adds something from a small pourch he carries. With a quick sizzle he pours some on his boots and the crud melts away. 'See that? Didn't do anything but get rid of the crud. This stuff is great. It doesn't burn yer skin or valuables. Here ya go, you can have the rest.");
        e.other:QuestReward(e.self,0,0,0,0,19974,10000); -- Jar of Gnomish Cleaning Paste
    end
    item_lib.return_items(e.self, e.other, e.trade)
end