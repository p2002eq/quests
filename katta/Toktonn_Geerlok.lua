---- Quest:Grimling Picks
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Well met, kind " .. e.other:Race() .. ". I am Governor Toktonn Geerlok of the Loyalist Combine. It is my duty to oversee all matters concerning engineering, construction, and maintenance within Katta Castellum. There is a wonderful ore native to Luclin called [Acrylia] that has proved to be a valuable asset to my crew and I.");
    elseif(e.message:findi("acrylia")) then
        e.self:Say("Yes, it is a marvelous luminescent ore that when properly smelted has properties similar to the finest of steels, and sometimes even better. Depending on the purity of the ore of course. The Tenebrous Mountains are rich with very pure acrylia veins but unfortunately the Grimlings have overrun the mines and are not willing to allow others to mine the ore. Instead they horde it for their tribes to the south. I am permitted by the Validus Custodus to reward those seeking to cleanse the mines of the Grimlings. More precisely to pay a reward for every four grimling mining picks presented to me.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2695, item2 = 2695, item3 = 2695, item4 = 2695})) then -- 4x Sturdy Grimling Mining Pick
        e.self:Say("Excellent! Soon the grimlings may be coerced into being less stingy with their precious ore!");
        e.other:Faction(52,5); -- Concillium Universus
        e.other:Faction(284,-10); -- Seru
        e.other:Faction(142,-10); -- Heart of Seru
        e.other:QuestReward(e.self,0,0,0,0,31727,10000); -- Industria Acrylia War Pick
    end
    item_lib.return_items(e.self, e.other, e.trade)
end