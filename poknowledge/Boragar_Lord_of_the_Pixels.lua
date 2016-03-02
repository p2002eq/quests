function event_say(e)
    local qglobals = eq.get_qglobals(e.self, e.other);

	if(e.message:findi("Hail")) then
	    e.self:Say("Well, hello there Traveler. Being the Lord of the Pixels has its advantages, and I am feeling quite [generous] today.");
	elseif (e.message:findi("generous")) then
	    e.self:Say("I have a few items you may enjoy, but first I need you to complete a few [tasks].");
	elseif (e.message:findi("tasks")) and (qglobals["Anniversary"] == "1") and (e.other:HasItem(2469)) then     -- Finished first task already.
	    e.self:Say("I have a pair of old [boots] or an old [mask] you may like, but you will need to collect the appropriate materials to make them fit along with a new cap for me to use.  Or since it appears you already have a mask, you can move onto the [third task]");
    elseif (e.message:findi("tasks")) and (qglobals["Anniversary"] == "1") then     -- Finished first task already.
	    e.self:Say("I have a pair of old [boots] or an old [mask] you may like, but you will need to collect the appropriate materials to make them fit along with a new cap for me to use.");
	elseif (e.message:findi("boots")) and (qglobals["Anniversary"] == "1") then 
	    e.self:Say("My old journeyman boots of course!  Bring me a Leatherfoot Raider Skullcap, a leather padding, some butter and a steel boning and we will make sure these boots fit.");
	elseif (e.message:findi("mask")) and (qglobals["Anniversary"] == "1") then 
	    e.self:Say("Many a times my old mask helped me fit into situations that would otherwise be cramped, if you know what I mean. Bring me a Leatherfoot Raider Skullcap, a leather padding, some butter and a steel boning and we will make sure this mask fits.");
	elseif (e.message:findi("prefer boots")) and (qglobals["Anniversary"] == "2") then 
	    e.self:Say("Have fun traveling norrath!");
	    e.other:QuestReward(e.self, 0,0,0,0, 2300, 1);
	elseif (e.message:findi("prefer mask")) and (qglobals["Anniversary"] == "2") then 
	    e.self:Say("Enjoy walking around Neriak!");
	    e.other:QuestReward(e.self, 0,0,0,0, 2475, 1);
	elseif (e.message:findi("third task")) and (qglobals["Anniversary"] == "2") then     -- Finished second task already and haven't gotten reward yet.
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
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 12073, item2 = 16488, item3 = 29742, item4 = 12259})) then
	    eq.set_global("Anniversary","2",5,"F");
	    e.self:Say("Great, it is all here, would you [perfer the mask] or [perfer the boots].");
    end
    
 	item_lib.return_items(e.self, e.other, e.trade);
end