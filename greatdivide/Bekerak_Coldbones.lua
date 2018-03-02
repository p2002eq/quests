function event_say(e)
	if(e.message:findi("hail") and (e.other:GetFaction(e.self) < 6)) then
		e.self:Say("Just another boring day waiting for supplies.  I wonder when they will arrive.");
	end
end


function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25106})) then -- # Handin: Bekerak's New Spear 
			e.self:Say("Well, well, I see Wenglawks finally got around to sending me my new spear. I hope it's not as shoddy as the last one. Your payment? Bahaha, did Wenglawks not tell you? Payment was to be a giant icewurm tooth carved into an amulet. Come now, little one. I will find an ice wurm for us to slay together. Then you can pull one of its teeth out for me and I will fashion the talisman for that greedy merchant.");
	        e.other:QuestReward(e.self,0,0,0,0,0,100); 
			eq.spawn2(118164,0,0,-2776,-3011,255.5,131.0)
			
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25191})) then -- # Handin: Giant Shard Wurm Tooth
			e.self:Emote("pulls out a large knife and begins to carve at the tooth. After a few minutes he pulls out a length of rope and fashions it into a very large necklace. 'Here is his payment. Tell him the spear is fine, and that I might reconsider his last offer to me. He will know what I mean.'");
            e.other:QuestReward(e.self,0,0,0,0,25130,100); 
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25266})) then -- # Giant Sack of Supplies
			e.self:Say("Supplies from Svekk?  Where are the rest of them little one!  There must be more, we are here pushing the Coldain back into their hole in the wall and Svekk sends a $race to deliver a small portion of supplies.  Take this note back to that fool.  Leave quickly before I take my rage out upon you.");
		    e.other:Faction(189,10); -- # Kromzek
		    e.other:Faction(188,10); -- # Kromrif
		    e.other:Faction(49,-30); -- # Coldain
		    e.other:Faction(42,-30); -- # Claws of Veeshan
		    e.other:QuestReward(e.self,0,0,0,0,25267,250);	
	    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25269})) then -- # Large Supply Sack for Bekerak
			e.self:Say("I am in your debt, " .. e.other:GetRace() .. ".  These supplies will help our effort to destroy the Coldain.  I wish I had more to give than what I do.'  Bekerak pulls a strange looking totem on a string from one of his pockets and hands it to you.  'May Lord Rallos smile upon you, $name.'");
		    e.other:Faction(189,10); -- # Kromzek
		    e.other:Faction(188,10); -- # Kromrif
		    e.other:Faction(49,-30); -- # Coldain
		    e.other:Faction(42,-30); -- # Claws of Veeshan
		    e.other:QuestReward(e.self,0,0,0,0,25268,250);	
		end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
