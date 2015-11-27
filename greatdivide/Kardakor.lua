function event_say(e)
	if(e.other:GetFaction(e.self) == 1) then -- CoV Ally
	    if(e.message:findi("hail")) then
		    e.self:Say("Hello, " .. e.other:GetName() .. ". It is not very often that I see adventurers back in this cave unless they have intentions of hurting the kind wurms here. I can only hope that for your sake that your intentions are good.");
        elseif(e.message:findi("glanitar")) then
		    e.self:Say("Glanitar? It has been quite long sense I have seen Glanitar, I fear that something unfortunate has become of him. It is not like him at all to be away for this long. He was out on normal patrol with a few others when they disappeared. We have not heard from any of them.");
        elseif(e.message:findi("disappear")) then
    		e.self:Say("This, I do not know. There are a few Giant forces that I have heard word of moving into the area. It is tough to say where they could have gone and if something happened to them or not who would be to blame. I highly doubt the Coldain would dare attack one of our units. The last I heard of them was when they left for the patrol of the Divide; this could have been anywhere. I remember that Glanitar carries a talisman from his mother. If you are to find any sign of Glanitar or any of the others please come to me first along with something that would symbolize who you received or took it from.");
        elseif(e.message:findi("rolandal")) then
		    e.self:Say("Rolandal is an old and wise Wurm that is very well traveled and skilled in the magics of Identification. He will be able to tell you who this talisman came from. You can find him in his dwelling not too far from my home. Seek him out and inform him that i have sent you. If Rolandal can sense that your word is true proceed to tell him that you possess a talisman that you need Identified and he shall help you further. I thank you for your efforts and wish you luck, $name.");
        end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) == 1) then -- CoV Ally    
	    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1861, item2 = 1862})) then
	    	e.self:Say("You... are.. balanced... and.. powerful.. for.. a.. mortal... " .. e.other:GetName() .. " ..... " .. e.other:GetName() .. ". More.. so.. than.... Magi'kot. But.... you.. are.. not.. yet.. ready.. to.. transcend.. transcend... this.. mortal.. coil. Take.. take.. seize.. this.. Orb... for.. you.. are.. worthy.. of.. reward.. and.. with... the.. aid.. of... the... balance.. balance.. contained.. within.. the.. Orb.. you.. may.. yet.. reach.. the... ultimate... Mastery.");
    		e.other:Faction(362,20); --# Yelinak
    		e.other:Faction(42,20); --# Claws of Veeshan
    		e.other:Faction(189,-60); --# Kromzek
    		e.other:QuestReward(e.self,0,0,0,0,1861,50000);
    		eq.set_global("CircletFalinkan","1",5,"F");
	    end    
    end
	item_lib.return_items(e.self, e.other, e.trade)
end