function event_say(e)
    
    if(e.other:GetFaction(e.self) < 5) then -- indiff?
        if(e.message:findi("hail")) then
            e.self:Emote("curtsies politely.");
            e.self:Say("Welcome to our home! I am the Countess Silveana of the Tunarean [" .. eq.say_link("Court") .. "].");
        elseif(e.message:findi("court")) then
		    e.self:Say("The Tunarean Court consists of several of Tunare's most blessed creatures. We Sifaye help defend the wakening land from the invading [" .. eq.say_link("giants") .. "] to the east and watch for threats from the dragons to the west.");
	    elseif(e.message:findi("giants")) then
		    e.self:Say("There is a giant with a strange metal stick that has been the largest threat as of late. He wanders further into our lands than the other with the stick to his eye and squashes my Sifaye when he finds them. If you eliminate him for us I would like to see that stick he carries.");
        end
    end
end

function event_trade(e)
	local item_lib = require("items");

    if(e.other:GetFaction(e.self) < 5) then -- indiff?
        if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30221})) then
            e.self:Emote("claps boisterously.");
            e.self:Say("My people are in your debt for putting an end to that monster's murderous squashings! Here is the crest of the Sifaye.");
            e.other:Faction(344, 30);
            e.other:QuestReward(e.self,0,0,0,0,24866,100);
        end
    end
	item_lib.return_items(e.self, e.other, e.trade)
end