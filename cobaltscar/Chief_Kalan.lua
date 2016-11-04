function event_say(e)
    if(e.other:GetFaction(e.self) < 7) then
    	if(e.message:findi("hail")) then
    		e.self:Emote("nods respectfully.");
    		e.self:Say("Welcome to Siren Bay strange one. These beaches belong to my people, the Othmir. You are welcome in our villages as long as you do not cause trouble and are willing to either assist the shellfish collectors provide nourishment or aid the warriors defending the beaches.");
    	elseif(e.message:findi("aid the warriors")) then	
    		e.self:Say("There are many creatures that would prey on my people if it were not for the dedication of our warriors. The Bulthar and Ulthork often invade our territory and prey on our shellfish collectors. They are wasteful creatures and take more than they could possibly eat from the sacred seas.")	
    	elseif(e.message:findi("bulthar")) then	
    		e.self:Say("The Bulthar are sea elephant people. They are strong brutes with the intelligence of a clam. There is no reasoning with the savages since they seem to only understand their territorial instincts. There is a small herd of them that has taken up residence on the rocky beach beneath the lonely tower and have already injured many of our shellfish collectors. I will reward you for the trunks of every two brutes that you slay.");
    	elseif(e.message:findi("ulthork")) then	
    		e.self:Say("The Ulthork are walrus people. They are just as territorial and brutish as the Bulthar but are slightly more intelligent. They seem to be jealous of my people's prosperity and occasionally lead raiding parties onto our beaches. Our craftsman use the tusks of the slain Ulthork to carve ivory totems of praise to the ocean lord. I will gladly barter for no less than four pairs of Ulthork tusks.");
    	end
    end
end

function event_trade(e)
	local item_lib = require('items');
    if(e.other:GetFaction(e.self) < 7) then
    	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24874, item2 = 24874,item3 = 24874,item4 = 24874})) then
    		e.self:Say("Many thanks to you, strange one. Our craftsman will be pleased. They have been in need of a new bundle of ivory.");
    		e.other:Faction(241, 30); --Othmir
    		e.other:Faction(345, -60); --Ulthork
    		e.other:SummonItem(eq.ChooseRandom(10036, 22503, 16976, 10037, 10033, 10049, 10031, 10053, 10035, 10051, 10034, 10050, 10032, 10048));
    	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30068})) then	
    		e.self:Say("Such wasteful creatures the Bulthar are. It is a shame they are not intelligent enough to realize the harm they do to the very oceans that sustain them.");
    		e.other:Faction(241, 30); --Othmir
    		e.other:Faction(345, -60); --Ulthork
    		e.other:SummonItem(22817); --Runed Othmir Spear
    	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30067, item2 = 30067})) then	
    		e.self:Say("Such wasteful creatures the Bulthar are. It is a shame they are not intelligent enough to realize the harm they do to the very oceans that sustain them.");
    		e.other:Faction(241, 30); --Othmir
    		e.other:Faction(345, -60); --Ulthork
    		e.other:SummonItem(eq.ChooseRandom(10036, 22503, 16976, 10037, 10033, 10049, 10031, 10053, 10035, 10051, 10034, 10050, 10032, 10048));
    	end
    	item_lib.return_items(e.self, e.other, e.trade)	
    end
end
