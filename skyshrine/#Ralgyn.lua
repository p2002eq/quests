local qglobal_name = "CircletFalinkan";
function event_say(e)
    if(e.other:GetFaction(e.self) == 1) then
        if(e.message:findi("hail")) then
            e.self:Say("Hello, "..e.other:GetName()..", what brings you to these sacred quarters on this day? If it is treasure that you seek please ask someone else for I do not have time to think of such petty things. My worries are much greater at this time I am afraid.");
        elseif(e.message:findi("what worries")) then
            e.self:Say("Well I suppose I can tell you of my promise if you are willing to listen as I do not feel you have intentions of using anything I tell you against my dragonkin. Not many can walk these quarters unless they are very trusted amongst us.");
        elseif(e.message:findi("what promise")) then
            e.self:Say("I made a promise a very long time ago to my wingmate Faliana, a promise that I feel I may have broken.");
        elseif(e.message:findi("broken")) then
            e.self:Say("I promised my dear Faliana that I would always keep her talisman close to me. If something has happened to my son I must retain his talisman so that I may keep Faliana's Talisman secure, as I promised her I always would. Before she perished she split her talisman into two pieces one of which I always will carry and the other half which my son Glanitar carries. My son has not returned to me for some time and I am deeply concerned for this is not normal behavior for him. I fear something must have happened to him for he has never been so involved in his training to not inform me of his whereabouts or to not come visit.");
        elseif(e.message:findi("what training")) then
            e.self:Say("It seems like it was only yesterday that my only son Glanitar was practicing his skills as a young Wurm. Before long he quickly mastered many fighting skills and the development of his magical skills rapidly progressed. He was coming along so well in his training that he was quickly drafted for the Patrol. Even when he was away for his training he would often return to me and tell me of his progress. I was very proud of him for his involvement with the Patrol. Although I am very proud of his accomplishments, I have not seen him for longer then I have ever been away from him and I fear for the worst.");
        elseif(e.message:findi("what patrol")) then
            e.self:Say("Ah yes, the patrol. Well in the Great Divide there is a collection of caves that the dragonkind holds as a sacred territory. For this reason we always have a number of our strongest up and coming younger ones train there with the great [Kardakor]. They patrol the caved labyrinth to make sure it is free from unwanted intruders who are quickly dealt with upon discovery.");
        elseif(e.message:findi("Kardakor")) then
            e.self:Say("Kardakor is a strong and powerful Warrior. He has fought in many battles against the vile Giants and is well respected amongst our people as a champion. For this reason when one was needed to train our young fighters seeking guidance in developing both their magical and fighting techniques it was clear to us who we should select for this honor, Kardakor.");
        end
    end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.self, e.other);
    local item_lib = require("items");

    if(e.other:GetFaction(e.self) <= 1) and (qglobals["CircletFalinkan"] == "2") then -- Must be ally
        if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1866})) then
            e.other:Faction(362, 10); --Yelinak
            e.other:Faction(42, 10); --CoV
            e.other:Faction(189, -30); --Kromzek
            e.other:QuestReward(e.self, 0,0,0,0, 1867, 100000);
            eq.delete_global(gqlobal_name);
        end
    end

    item_lib.return_items(e.self, e.other, e.trade);
        
end
