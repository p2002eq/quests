function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Greetings, " .. e.other:Race() .. ". You are welcome in [" .. eq.say_link("Kejek") .. "] so long as you do not offend the [spirits] of these lands.");
    elseif(e.message:findi("kejek")) then
        e.self:Say("This is Kejek, our village on the peak of Mt. Klaw. It is here that we continue to cherish the customs and beliefs of our ancestors, the Vah'Shir. Our location here in the Stonebrunt Mountains and the protection of the [" .. eq.say_link("spirits") .. "] allows us to escape the persecution and war that is waged between our yellow furred cousins and the Erudites.");
    elseif(e.message:findi("spirits")) then
        e.self:Say("There are spirits around us always, the spirits of our ancestors, and the spirits of the beasts that have past on beyond the mortal realms. It is through our devotions to these spirits that we shaman are granted our mystical powers. A few of the more powerful spirits are capable of becoming flesh once again and wander the wild serving as protectors and guides.");
    elseif(e.message:findi("Jali sent me")) then
        e.self:Say("Ah yes Jali, whose wife is ill. I have been looking for a cure for many moons. I do believe I can make one now if I had the proper ingredients. Unfortunately it will require the deaths of some of our lands creatures but the spirits will not be angered as it is for a noble cause. Perhaps you could [" .. eq.say_link("fetch them") .. "] for me?");
    elseif(e.message:findi("fetch them")) then
        e.self:Say("Take this satchel and please listen closely. I need the following and they need to be relatively fresh. So don't waste time with frivolous strolls through the jungle. I require two Panda Claws, two Tiger Skins, two Asp Poison Sacs, a Bamboo Shoot, and a Kejekan Palm Fruit, which you will need to find somewhere in the jungle. Once you have these items, combine them in the bag and return to me.");
        e.other:SummonItem(17884); -- Burlap Satchel
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6975  })) then --Full Gathering Satchel
        e.self:Say("I thought the kobolds would have you for dinner, but you made it back.");
        e.self:Emote("Ayssla takes the satchel and begins to pour different vials of foul smelling liquid into it. She then takes the entire contents of the bag and dumps it into a large kettle and begins to chant in an unknown language. After a few minutes, she takes a small amount of the now boiling liquid and puts it in a vial.");
        e.self:Say("Take this vial back to Jali. I pray to the Titan Spirits that it works.");
        e.other:QuestReward(e.self,0,0,0,0,6976,1000);  -- Vial of Healing Liquid
        e.other:Faction(172, 5, 0); -- Kejek Villiage
        e.other:Faction(247, 1, 0); -- Peace Keepers
    end
    item_lib.return_items(e.self, e.other, e.trade);
end