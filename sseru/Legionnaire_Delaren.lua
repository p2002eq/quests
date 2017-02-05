---- Quest:Zelniak Meat
function event_spawn(e)
    peran = 0
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Well met " .. e.other:GetName() .. ". are you the new recruit that was sent to me to help exterminate the [Zelniaks] that attack our guards and caravans?");
    elseif(e.message:findi("zelniaks")) then
        e.self:Say("Weren't you briefed on this already? The zelniaks are highly aggresive scaled creatures with a large mane of fur that runs down the length of their back. They are a constant problem for the guards and caravans that used to travel in [dawnshroud].");
    elseif(e.message:findi("dawnshroud")) then
        e.self:Say("are you new here or something? The Dawnshroud Peaks are a range of mountains lush in vegetation and water. We used to utilize the area as a trade route to Shadow Haven. The caravans that would travel through were often attacked by roaming zelniaks. I thought you were the one that was sent to me to [help lower] the amount of zelniaks in the area. So the trade route could be reestablished.");
    elseif(e.message:findi("lower")) then
        e.self:Say("How ambitious of you to help the mighty warriors of the Hand. If you choose to serve Seru bring me back four Zelniak Meat. I will reward you for your time in the field.");
    elseif(e.message:findi("peran") and peran == 1) then
        e.self:Say("Centurion Peran is new to the tanks. He gets things done I suppose it just takes him a long, long time. Since you did his job for him, take him these new orders. We will make a soldier out of him yet.");
        e.other:SummonItem(6514); -- Perans Orders
        peran = 0
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10692, item2 = 10692, item3 = 10692, item4 = 10692})) then -- 4x Zelniak Meat
        e.self:Say("Although your service to Seru is appreciated, I just recieved word that you were not the one that was sent to do this menial task. That lazy boy [Peran] was supposed to take the job.");
        e.other:Faction(37,2); -- Citizen of Seru
        e.other:Faction(139,2); -- Hand of Seru
        e.other:Faction(142,2); -- Heart of Seru
        e.other:Faction(96,2); -- Eye of Seru
        e.other:Faction(298,2); -- Shoulder of Seru
        e.other:Faction(168,-4); -- Katta Castellum Citizen
        e.other:QuestReward(e.self,8,9,4,2,0,1000); -- Faction, minor cash and EXP
        peran = 1
    end
    item_lib.return_items(e.self, e.other, e.trade)
end