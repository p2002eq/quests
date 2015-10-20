-- 



function event_say(e)
    if(e.other:GetFaction(e.self) <= 4) then
	    if(e.message:findi("hail")) then
		    e.self:Say("I do not have time for you now. My son is lost, and you can not help me.");
		elseif(e.message:findi("son")) then
		    e.self:Say("Have you seen him? I must find him, he has been gone far to long! If you have harmed him, I will slay you and all of your race! Tell me where he is!");
	    end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) <= 4) then
	    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27260})) then
		    e.other:Faction(42,10);   --Claws of Veeshan
		    e.other:Faction(362,10);  --Yelinak
		    e.other:Faction(189,-30); --Kromzek
	        e.other:QuestReward(e.self,0,0,0,0,27261,150000);
	        
	end
	item_lib.return_items(e.self, e.other, e.trade)
end