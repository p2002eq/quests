---- Quest:Acrylia Phosphate & Zelniak Oil
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Pleasure to meet ya! Have you come to the Illuminarium Industria to gaggle about or have you come looking for [some work]?");
    elseif(e.message:findi("some work")) then
        e.self:Say("Well in that case I sure could use the assistance of a powerful " .. e.other:Race() .. " such as yourself. You see my job here is to construct the lighting for Katta Castellum and I'm always in need of more supplies. I need a fresh supply of [zelniak oil] for the standard city street lanterns and a fresh supply of [acrylian phosphate] to construct more phosporous lanterns and torches.");
    elseif(e.message:findi("acrylian phosphate")) then
        e.self:Say("Acrylian phosphate is an uncommon mineral deposit containing the same mineral compound that provides acrylia ore with its self luminescence. The acrylian phosphate also burns very well and at extremely high temperatures for very long periods of time. I will trade with you for every four piles of acrylian phosphate you can supply me.");
    elseif(e.message:findi("zelniak oil")) then
        e.self:Say("Zelniaks are strange creatures that live on the light side of Luclin. Their fat can be boiled in a brew barrel with a flask of water and poured into an empty bottle to produce an oil that is an excellent fuel for lanterns. I will trade for every four bottles of zelniak oil you produce for me.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10690, item2 = 10690, item3 = 10690, item4 = 10690})) then -- 4x Acrylian Phosphate
        e.self:Say("'Thank you " .. e.other:GetName() .. "! This acrylian phosphate is such a wonderful mineral both for producing extremely long lasting lights and also for the aversion vampyres seem to have to the way it burns!");
        e.other:Faction(168,2); -- Katta Castellum Citizens
        e.other:Faction(350,1); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(37,-1); -- Citizens of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(298,-1); -- Shoulders of Seru
        e.other:QuestReward(e.self,0,0,0,0,2596,5000); -- Phosphorous Torch
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10691, item2 = 10691, item3 = 10691, item4 = 10691})) then -- 4x Zelniak Oil
        e.self:Say("'Thank you " .. e.other:GetName() .. "! Zelniak oil is surely the best fuel source for our street lamps. It should burn bright enough to ward off those vampyres.. I hope."); -- adlib
        e.other:Faction(168,2); -- Katta Castellum Citizens
        e.other:Faction(350,1); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(37,-1); -- Citizens of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(298,-1); -- Shoulders of Seru
        e.other:QuestReward(e.self,0,0,0,0,10694,5000); -- Combine Fire Flasks
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
