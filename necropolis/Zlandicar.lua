function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hrmm, who have we here?  A fleshling that managed to work past my guards...apparently, then, you have your wits about yourself.  In that case, perhaps you might be useful.  I need you to kill a ratman named [" .. eq.say_link("who is neb",false,"Neb") .. "], because I cannot find him and he resides in an area too small for me to reach.  He and his clan of Paebala rats are of great annoyance to me, and need to be eradicated so that I may focus on greater tasks at hand.");
  
	elseif(e.message:findi("who is neb")) then
		e.self:Say("Neb is an enemy of my clan of Chetari ratmen, and a thorn in my side.  Slaughter him and bring me his head, and I will give you the key to Jaled-Dar's Tomb.");
    end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 26010})) then 
		e.self:Say("Thank you for your assistance.  Now I may get back to higher matters at hand.  Leave me.");
		e.other:Faction(32, 3);
		e.other:Faction(365, 3);
		e.other:Faction(42, -6);
		e.other:Faction(273, -6);
		e.other:QuestReward(e.self,0,0,0,0,28060,250000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--All text is COMPLETELY wrong.  But, it's a template, and it gets you the important item--a key to Jaled-Dar's Tomb so that you may get your sleeper key.
--Fix this please.
