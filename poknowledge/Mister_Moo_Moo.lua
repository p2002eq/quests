function event_spawn(e)
  eq.set_timer("quips",math.random(750000));
end

function event_timer(e)
  local random_say = math.random(2);

  if(random_say == 1) then
    e.self:Say("The cow level is only an illusion...");
  else
    e.self:Say("Is there any cold milk in this crazy town?");
  end
  eq.set_timer("quips",math.random(750000));
end




function event_say(e)
  local qglobals = eq.get_qglobals();

  if(e.message:findi("hail")) then
    e.self:Say(" [" .. eq.say_link("Moo") .. "] Hi, My name is Mister Moo Moo.");
  elseif(e.message:findi("moo")) then
    e.self:Say("You speak like me, but you are no [" ..eq.say_link("yakman") .. "]...");
  elseif(e.message:findi("yakman")) then
    e.self:Say("Look. I need you to keep your voice down. I am not much of a cow lately because I have ran out of [" ..eq.say_link("milk") .. "]."); -- eq say link added
  elseif(e.message:findi("milk")) then
    e.self:Say("Milk. Yes. It is milk that can help me. Bring me four bladders of the coldest milk. ");
  elseif(e.message:findi("there is no")) then
 	  e.other:SetRace(eq.ChooseRandom(181));
    e.self:Say("...Then where do cows come from...?");
  end
end

function event_trade(e)
  local item_lib = require("items"); -- load eq item db

  if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19150,item2 = 19150,item3 = 19150, item4 = 19150})) then -- Bladder of Otter milk
    e.self:Say("Ahh! I feel much better now! Mooooooooooo.");
    --[[
    e.other:Ding(); -- creates quest sound
    e.other:AddEXP(10); -- gives XP
    e.other:GiveCash(0,0,4,0);
    e.other:SummonItem(13466); -- give Kabob
    ]]--
    e.other:QuestReward(e.self,0,0,2,0,13466,10); -- Why is this off?
  else
    e.self:Say("If you call this milk, you must be a High Elf...  Can't you see these udders?")
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

