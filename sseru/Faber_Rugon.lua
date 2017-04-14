---- Quest:Ogrebane's Armor

function event_trade(e)
    local item_lib = require("items");
    
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31787, item2 = 31787})) then -- 2x Pristine Lightcrawler Shell
        e.self:Say("Oh, this is a fine piece of armor I made for ya!");
        e.other:QuestReward(e.self,0,0,0,0,29879,5000); -- Lightcrawler Breastplate
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31788, item2 = 31788, item3 = 31966, item4 = 31966})) then -- 2x Lightcrawler Legs & 2x Shimmering Lightcrawler Shell
        e.self:Say("Oh, this is a fine piece of armor I made for ya!");
        e.other:QuestReward(e.self,0,0,0,0,29878,5000); -- Lightcrawler Greaves
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31965, item2 = 31965})) then -- 2x Ardent Lightcrawler Shell
        e.self:Say("Oh, this is a fine piece of armor I made for ya!");
        e.other:QuestReward(e.self,0,0,0,0,29876,5000); -- Lightcrawler Helm
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31968, item2 = 31968})) then -- 2x Stripped Lightcrawler Shell
        e.self:Say("Oh, this is a fine piece of armor I made for ya!");
        e.other:QuestReward(e.self,0,0,0,0,29880,5000); -- Lightcrawler Bracer
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31967, item2 = 31967})) then -- 2x Spotted Lightcrawler Shell
        e.self:Say("Oh, this is a fine piece of armor I made for ya!");
        e.other:QuestReward(e.self,0,0,0,0,29877,5000); -- Lightcrawler Vambraces
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end