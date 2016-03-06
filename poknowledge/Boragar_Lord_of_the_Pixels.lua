local qglobal_name = "Anniversary";

function event_say(e)
    local qglobals = eq.get_qglobals(e.self, e.other);
    if(e.message:findi("Hail")) and (qglobals["Anniversary"] == "2") then
        e.self:Say("I still owe you a reward, would you [prefer the mask] or [prefer the boots].");
	elseif(e.message:findi("Hail")) and (e.other:HasItem(31961) == false) then
	    e.self:Say("Well, hello there Traveler. Being the Lord of the Pixels has its advantages, and I am feeling quite [generous] today.");
	elseif (e.message:findi("generous")) and (e.other:HasItem(31961) == false) then
	    e.self:Say("I have a few items you may enjoy, but first I need you to complete a few [tasks].");
	elseif (e.message:findi("tasks")) and (e.other:HasItem(31961) == false) then                                              -- Dialogue for first Task
        e.self:Say("I need you to bring to me a Strand of Nightmare which can be obtained by combining the following items in a fletching kit.  A Scorpion Pincer, Rhino Beetle Carapace, Bixie Wing, Forest Drakeling Scales, Steamfont Spring Water, Patch of Gnoll Fur, Black Mamba Skin and a Pristine Krag Claw.  After you finish this, I will have the next task for you");		    
	elseif (e.message:findi("second task")) and (qglobals["Anniversary"] == "1") and (e.other:HasItem(2469)) then     -- Finished first task and have guise already.
	    e.self:Say("Since you already own a mask yourself you can move onto my [third task], or if you prefer, I have a pair of old [boots] you can have.");
    elseif (e.message:findi("second task")) and (qglobals["Anniversary"] == "1") then     -- Finished first task already and doesn't have guise.
	    e.self:Say("I have a pair of old [boots] or an old [mask] you may like, but you will need to collect the appropriate materials to make them fit along with a new cap for me to use.");
	elseif (e.message:findi("boots")) and (qglobals["Anniversary"] == "1") then 
	    e.self:Say("My old journeyman boots of course!  Bring me a Leatherfoot Raider Skullcap, a leather padding, some butter and a steel boning and we will make sure these boots fit.");
	elseif (e.message:findi("mask")) and (qglobals["Anniversary"] == "1") then 
	    e.self:Say("Many a times my old mask helped me fit into situations that would otherwise be cramped, if you know what I mean. Bring me a Leatherfoot Raider Skullcap, a leather padding, some butter and a steel boning and we will make sure this mask fits.");
	elseif (e.message:findi("prefer the boots")) and (qglobals["Anniversary"] == "2") then 
	    e.self:Say("Have fun traveling norrath!");
	    e.other:QuestReward(e.self, 0,0,0,0, 2300, 1);
	elseif (e.message:findi("prefer the mask")) and (qglobals["Anniversary"] == "2") then 
	    eq.set_global("Anniversary","9",5,"F"); -- flag people who received guise from event, so they can't do third task.
	    e.self:Say("Enjoy drinking at all the bars in Neriak!");
	    e.other:QuestReward(e.self, 0,0,0,0, 2469, 1);
	elseif (e.message:findi("third task")) and (qglobals["Anniversary"] ~= "9") and (e.other:HasItem(2469)) and (qglobals["Anniversary"] == "1") then     -- Finished first task already and had a guise before event.
	    e.self:Say("Bring me an Artisan's Seal, a Coldain hunting blanket, one Liquid Velium and a Saucy Bunnymeat to claim your reward.");
	end
end


function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16261})) then
	    eq.set_global("Anniversary","1",5,"F");
	    e.other:QuestReward(e.self, 0,0,0,0, 31961, 1);
	    e.self:Say("Enjoy your new rod and make sure not to light yourself on fire!  Let me know when you are ready for the [second task].");
    elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 12073, item2 = 16488, item3 = 29742, item4 = 12259})) then
	    eq.set_global("Anniversary","2",5,"F");
	    e.self:Say("Great, it is all here, would you [prefer the mask] or [prefer the boots].");
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 23609, item2 = 30135, item3 = 1857, item4 = 1452})) then
	    eq.set_global("Anniversary","3",5,"F");
	    e.self:Say("Great, it is all here, take this breasplate, you earned it.  If you prefer one of the other items I have, just hand it back to me and we will get you something else.");
	    e.other:QuestReward(e.self, 0,0,0,0, 4164, 1);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 4164})) then
	    e.other:QuestReward(e.self, 0,0,0,0, 6204, 1);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 6204})) then
	    e.other:QuestReward(e.self, 0,0,0,0, 24890, 1);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 24890})) then
	    e.other:QuestReward(e.self, 0,0,0,0, 11604, 1);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 11604})) then
	    e.other:QuestReward(e.self, 0,0,0,0, 4164, 1);
    end
    
 	item_lib.return_items(e.self, e.other, e.trade);
end