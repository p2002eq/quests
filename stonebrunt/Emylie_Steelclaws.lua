function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Shalom friend. My mate Kalaaro is the primary blacksmith of our village. I mostly create his tools, do touch ups and refurbishes, and maintain the [" .. eq.say_link("kejek forge") .. "].");
    elseif(e.message:findi("kejek forge")) then
        e.self:Say("'Our forge has received the blessings of the Titan Spirits to burn with a supernatural flame! This flame has many beneficial properties but most importantly it can aid in freeing the spirits that have been imprisoned in materials by evil sorcerers.");
    elseif(e.message:findi("purification process")) then
        e.self:Say("The crystalline shadow must be purified in the kejek forge using a special hammer blessed by the Titan Spirits. I will craft a hammer for you to take to the Titans for their blessings if you bring me a Large Brick of High Quality Ore and an Oak Shaft. Once the hammer is blessed you may use it in the kejek forge to purify the crystalline shadow and transfer the spirits contained within it to a Soul Orb that must be taken to our village seer.")
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10469,item2 = 10456})) then -- Large Brick of High Quality Ore, Oak Shaft
        e.self:Emote("takes the supplies and begins to work on the hammer. She works swiftly and efficiently then cools the finished hammer and hands it to you.");
        e.other:QuestReward(e.self,0,0,0,0,6981,100);  -- Kejekan Smithy Hammer
        e.other:Faction(172, 2, 0); -- Kejek Villiage
        e.other:Faction(247, 1, 0); -- Peace Keepers
    end
    item_lib.return_items(e.self, e.other, e.trade);
end