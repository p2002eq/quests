function event_say(e)
    fac = e.other:GetFaction(e.self);
    if(e.message:findi("Hail")) then
        e.self:Say("Oh yes. hello there. I am sorry to be so short, but Governor Erikal had asked me to investigate the [Recuso] and... well, the going has been slow as of yet.");
    elseif(e.message:findi("recuso")) then
        e.self:Say("The Recuso are a delitescent people that wander the lands outside Sanctus Seru. They do not have the most open society, so gathering information on them has been tricky. We have reason to believe that they are quite hostile towards Seru and therefore our potential allies- the enemy of my enemy is my friend and all of that. To learn more about them, it was decided we send someone in to try to blend into their society, but he is more than a week past due checking in and we can spare no one to [go after him].");
    elseif(e.message:findi("go after him/") and (fac <= 2)) then
        e.self:Say("It is quite the journey, are you sure that you are up for it? Your best bet would be to start the search in Marus Seru where the Recuso can be found. Legionnaire Marais had a lead in Shadowhaven as well, but I do not believe it had gotten him anywhere yet. You will need to give him this, he has the other half and will recognize it as a signal that you were sent directly by me. Oh, and let me give you a file to hold your evidence in, do you have [room] for it, my friend?");
        e.other:SummonItem(18332); -- torn half of a note
    elseif(e.message:findi("room")) then
        e.self:Say("Here, this should do, there may be some extra space in there when you are done. Just put all the evidence you find in it and get it back to me as soon as you can. Best of luck to you, and my thanks as well.");
        e.other:SummonItem(17515); -- Recuso Case File
    elseif(e.message:findi("seru")) then
        e.self:Say("I know that to most it seems as though we do not even pay attention to each other anymore, but the silent war between Seru and Katta has never really subsided.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 34035})) then -- Recuso File - Closed
        e.self:Say("Outstanding work, " .. e.other:GetName() .. " - Marais' sacrifice will not be in vain. It seems the Recuso are not the potential allies we had hoped for, but once I get someone from the Magus Conlegium to open this book it should prove educational indeed. In a silent war, learning the secrets of your adversary is paramount. This belt honors one of our finest heroes, wear it proudly for the service you have done the Validus Custodus.");
        e.other:QuestReward(e.self,0,0,0,0,29894,5000); -- Belt of Galin
    end
    item_lib.return_items(e.self, e.other, e.trade)
end