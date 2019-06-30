---- Quest: Goblin Raiders, Goblin Battlemasters

function event_say(e)
  local qglobals = eq.get_qglobals();

  if(e.message:findi("hail")) then
    e.self.say("Hail! Beware of the [" ..eq.say_link("goblin raiders") .. "] roaming the plains outside of Firiona Vie. They have caused much trouble and continue to assault this outpost.");
  elseif(e.message:findi("goblin raiders")) then
    e.self.say("The goblin raiders have been quite a nuisance to my trackers. I implore you to aid my men and lessen the presence of the vile beasts. Bring me proof that you have taken at least four of these raiders down. You shall earn the respect of this outpost and insure your own well-being.");
  end
end

function event_trade(e)
  local item_lib = require("items");

  if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12922, item2 = 12922, item3 = 12922, item4 = 12922})) then -- Red Headband
    e.self.say("You serve this outpost well. Here is a small reward. You should try and hunt down [" ..eq.say_link("Goblin Battlemasters") .. "]. I have very few resources to send into the plains to track them down. Perhaps you can help us.");
    e.other:QuestReward(e.self,0,0,8,0,eq.ChooseRandom(9006,7007,7008,6014,5019,6011),10); -- Random reward Kite Shield, Rusty Dagger, Rusty Rapier, Rusty Warhammer, Rusty Long Sword, Rusty Mace.
    e.other:Faction(92,3); -- +Emerald Warriors
    e.other:Faction(418,3); -- +Inhabitants of Firiona vie
    e.other:Faction(314,3); -- +Storm Guard
    e.other:Faction(193,-6); -- -Legion of Cabilis
    e.other:Faction(250,-6); -- -Swifttails

  elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12923, item2 = 12923, item3 = 12923, item4 = 12923})) then -- Goblin Bracer
    e.self:Say("Good work!! Please accept this piece of armor. It was crafted for the swiftly moving rangers of this outpost.");
    e.other:SummonItem(eq.ChooseRandom(12924,12925,12926,12927,12928,12929,12930,12931,12932,12933)); -- Faydark Ringmail items. 24..33 = Coif, Collar, Coat, Mantle, Skirt, Sleeves, Bracer, Gloves, Pants, Boots.
    e.other:Faction(92,5); -- +Emerald Warriors
    e.other:Faction(418,5); -- +Inhabitants of Firiona vie
    e.other:Faction(314,5); -- +Storm Guard
    e.other:Faction(193,-10); -- -Legion of Cabilis
    e.other:Faction(250,-10); -- -Swifttails
    else
    e.self:Say("This is not what I asked for...");
    end
  item_lib.return_items(e.self, e.other, e.trade);
end
