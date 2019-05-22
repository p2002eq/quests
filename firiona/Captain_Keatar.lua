---- Quest: Goblin Raiders, Goblin Battlemasters

function event_say(e)
  local qglobals = eq.get_qglobals();
-- Goblin raider block
  if(e.message:findi("hail")) then
    e.self.say("Hail! Beware of the [" ..eq.say_link("goblin raiders") .. "] roaming the plains outside of Firiona Vie. They have caused much trouble and continue to assault this outpost.");
  elseif(e.message:findi("goblin raiders")) then
    e.self.say("The goblin raiders have been quite a nuisance to my trackers. I implore you to aid my men and lessen the presence of the vile beasts. Bring me proof that you have taken at least four of these raiders down. You shall earn the respect of this outpost and insure your own well-being.");
  end
end

-- end Goblin raider block




function event_trade(e)
  local item_lib = require("items");
  -- implement random
  local random_reward = math.random(9);



  if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12922, item2 = 12922, item3 = 12922, item4 = 12922})) then -- Red Headband
    e.self.say("You serve this outpost well. Here is a small reward. You should try and hunt down [" ..eq.say_link("Goblin Battlemasters") .. "]. I have very few resources to send into the plains to track them down. Perhaps you can help us.");
    e.other:QuestReward(e.self,0,0,8,0,9006,10);
  elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12923, item2 = 12923, item3 = 12923, item4 = 12923})) then -- Goblin Bracer
    e.self:Say("Good work!! Please accept this piece of armor. It was crafted for the swiftly moving rangers of this outpost.")
    --ph random reward Faydark Ringmail
    if random_reward == 0 then
      e.other:QuestReward(e.self,0,0,8,0,12924,10); --Faydark Ringmail Coif
    elseif random_reward == 1 then
      e.other:QuestReward(e.self,0,0,8,0,12925,10); --Faydark Ringmail Collar
    elseif random_reward == 2 then
      e.other:QuestReward(e.self,0,0,8,0,12926,10); --Faydark Ringmail Coat
    elseif random_reward == 3 then
      e.other:QuestReward(e.self,0,0,8,0,12927,10); --Faydark Ringmail Mantle
    elseif random_reward == 4 then
      e.other:QuestReward(e.self,0,0,8,0,12928,10); --Faydark Ringmail Skirt
    elseif random_reward == 5 then
      e.other:QuestReward(e.self,0,0,8,0,12929,10); --Faydark Ringmail Sleeves
    elseif random_reward == 6 then
      e.other:QuestReward(e.self,0,0,8,0,12930,10); --Faydark Ringmail Bracer
    elseif random_reward == 7 then
      e.other:QuestReward(e.self,0,0,8,0,12931,10); --Faydark Ringmail Gloves
    elseif random_reward == 8 then
      e.other:QuestReward(e.self,0,0,8,0,12932,10); --Faydark Ringmail Pants
    elseif random_reward == 9 then
      e.other:QuestReward(e.self,0,0,8,0,12933,10); --Faydark Ringmail Boots
    else
    e.self:Say("This are not what I asked for...");
    end
  item_lib.return_items(e.self, e.other, e.trade);
  end
end
