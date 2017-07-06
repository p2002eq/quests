--#a_jovial_white_knight
--Plane of Mischief 1.0

--NPC Dialogue from https://www.project1999.com/forums/archive/index.php/t-158491.html
  
function event_say(e)
	if (e.message:findi("Hail")) then  
		e.self:Emote("Greetings! It is good to see another face within these depths. I have been traveling these mazes for many months now. Judging by the look of you, I do not expect that you will locate the exit. Especially since I have not yet been able to. My only wish is to find a squire to complete my knighthood. Say you wouldn't happen to... never mind. I do not expect that you can even comprehend the full extent of my attempt to communicate with you. Shove off commoner.");
	end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24565})) then --Check for White Squire
		local reward = math.random(1,10);
		e.self:Say("You have found it!! Thank Tunare! I apologize for my rude behaviour. These tunnels twist and bend my very thoughts. Perhaps this will assist you in your escape from this cruel joke Fizzlethorpe has been playing with our minds. I thank you friend.");
		e.other:SummonItem(13073,reward);  --random amount of bone chips rewarded
		e.other:AddEXP(100);
		eq.depop_with_timer();
    end 
	item_lib.return_items(e.self, e.other, e.trade);
end