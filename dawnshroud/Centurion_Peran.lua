---- Quest:Zelniak Meat
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hey there. Come to take a swim?");
    elseif(e.message:findi("mission")) then
        e.self:Say("Well, since you are so inquisitive I will tell you. The orders say to go to Maidens Eye and investigate reports of Vampyres in the area. Vampyres! Are the kidding?! I am just a Centurion! I know, I will continue to keep this area secure while you go investigate. Bring me sufficient proof of their existence in the area. Four piles of vampyre ashes should cover it. Well, get going! This mission isnt going to finish itself.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6514})) then -- Perans Orders
        e.self:Say("Bah, why do I always get stuck with the hard jobs. Here I am, out here patrolling the area in all this danger! They send me to even more threatening conditions? The life of a soldier is a hard one I tell ya! Oh well, off to do these orders I suppose. A shame no one will help me I am sure there is fame and fortune in the [" .. eq.say_link("mission") .. "]. More for me I suppose.");
        e.other:QuestReward(e.self,0,0,0,0,item,exp); --
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2692, item2 = 2692, item3 = 2692, item4 = 2692})) then -- 4x Vampyre Ashes
        e.self:Say("Hah! I knew that we could do it! Oh, you can take my weapon for helping me out again. I will just tell the Hand it was lost in battle. I guess that I better take this evidence back to the Hand, right after one more lap!.");
        e.other:Faction(284,2); -- Seru
        e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5303,5304,5305,5313,6303,6311,6312,7300,7301,7311,7499),1000); -- Combine Weapons
    end
    item_lib.return_items(e.self, e.other, e.trade)
end