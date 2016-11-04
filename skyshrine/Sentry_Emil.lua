function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Ah, hello, you must be the strangers that call yourselves friend to the Kin. Perhaps you would be interested in proving your worth?");
    elseif(e.message:findi("proving")) then
        e.self:Say("Good, then perhaps you wouldn't mind performing a small task then? With the betrayal of Kragen Morshire, the kin retreated from the Skyshrine and have taken up residence in the Tunare Court. Before I was called to guard the gate, I had been assigned to deliver a report to them. If you indeed wish to be friend to the kin, take this report to the Wakening. Eysa Florawhisper. She will give you a token indicating that she has received the message, return this to me and we may see a reward.");
		e.other:SummonItem(29067);
    end
end

function event_trade(e)
	local item_lib = require("items");
	
	-- Emil's report quest
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29623})) then
		e.self:Say("Your service is appreciated, "..e.other:GetName()..". I cannot reward you well at this point but you have come closer to the kin, the citizens of Skyshrine. Continue to prove your loyalty and greater rewards you may see, perhaps the greatest of all. . . in time.");
		e.other:Faction(344,10); -- tunarean court
    	e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(10),0,250);
    	
	end

	item_lib.return_items(e.self, e.other, e.trade)
end