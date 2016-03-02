function event_say(e)
	if(e.message:findi("Hail")) then
	    e.self:Say("Well, hello there Traveler. Being the Lord of the Pixels has its advantages, and I am feeling quite [generous] today.");
	elseif (e.message:findi("generous")) then
	    e.self:Say("I have a few items you may enjoy, but first I need you to complete a few [tasks].");
	elseif (e.message:findi("Hail1")) then
	elseif (e.message:findi("Hail2")) then
	elseif (e.message:findi("Hail3")) then
	elseif (e.message:findi("Hail4")) then
	elseif (e.message:findi("Hail5")) then
	elseif (e.message:findi("Hail6")) then
	elseif (e.message:findi("Hail7")) then
	elseif (e.message:findi("Hail8")) then
	elseif (e.message:findi("Hail9")) then
	end
	
	--(qglobals["CircletFalinkan"] == "1")
end


function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
	--		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1861,item2 = 1863, item3 = 1864, item4 = 1865})) then
	--e.other:QuestReward(e.self, 0,0,0,0, 1866, 100000);
 	--		eq.set_global("CircletFalinkan","2",5,"F");
 	
 	
 	item_lib.return_items(e.self, e.other, e.trade);
end