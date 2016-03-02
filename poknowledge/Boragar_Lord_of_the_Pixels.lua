function event_say(e)
    local qglobals = eq.get_qglobals(e.self, e.other);

	if(e.message:findi("Hail")) then
	    e.self:Say("Well, hello there Traveler. Being the Lord of the Pixels has its advantages, and I am feeling quite [generous] today.");
	elseif (e.message:findi("generous")) then
	    e.self:Say("I have a few items you may enjoy, but first I need you to complete a few [tasks].");
	elseif (e.message:findi("tasks")) and (qglobals["CircletFalinkan"] == "1") then     -- Finished first task already.
	    e.self:Say("ready for 2nd task");
	elseif (e.message:findi("tasks")) and (qglobals["CircletFalinkan"] == "2") then     -- Finished second task already.
	    e.self:Say("ready for 3rd task");
	elseif (e.message:findi("tasks")) then                                              -- Dialogue for first Task
        e.self:Say("I need you to bring to me a Strand of Nightmare which can be obtained by combining the following items in a fletching kit.  A Scorpion Pincer, Rhino Beetle Carapace, Bixie Wing, Forest Drakeling Scales, Steamfont Spring Water, Patch of Gnoll Fur, Black Mamba Skin and a Pristine Krag Claw.  After you finish this, I will have the next task for you");	
	end
	--and (e.other:HasItem(2469) or e.other:HasItem(2475)) 
end


function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16261})) then
	    eq.set_global("Anniversary","1",5,"F");
	    e.other:QuestReward(e.self, 0,0,0,0, 31961, 1);
    end
    
 	item_lib.return_items(e.self, e.other, e.trade);
end