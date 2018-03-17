function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("looks down at you. 'What is it you want, "..e.other:GetName().."? Why do you speak to the great Knight Clrakk Blackfist?'");
	elseif(e.message:findi("strife")) then
		e.self:Say("The Coldain have grown complacent. The defenses of their city are built to keep my kind and dragonkind at bay. However, their defenses against the smaller races such as yourself are not nearly as sophisticated. I wish to kill many Coldain, but now is not the time for that. There is a particular Coldain whose death will strike fear into the hearts of many. His name is Deaen Greyforge, a Coldain knight. He is both feared and respected by his kind. If you can destroy him, it will send a message to the Coldain that they are not safe from the wrath of the giants. Kill him and chop his body into bits. Bring me a few pieces as proof that the fool is dead.");
	end
	
end

function event_trade(e)
local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25115})) then
		e.self:Say("You truly are a [" .. eq.say_link("bringer of strife") .. "], "..e.other:GetName()..". Take this. I hope it will assist you. Use it in our war against the Coldain scum.");
		e.other:Faction(188, 10); --kromrif
		e.other:Faction(189, 10); --kromzek
		e.other:Faction(49, -20); --coldain
		e.other:Faction(42, -20); --cov
		e.other:SummonItem(25054); --Mask of Malediction 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25114})) then
		e.self:Say("You truly are a [" .. eq.say_link("bringer of strife") .. "], "..e.other:GetName()..". Take this. I hope it will assist you. Use it in our war against the Coldain scum.");
		e.other:Faction(188, 10); --kromrif
		e.other:Faction(189, 10); --kromzek
		e.other:Faction(49, -20); --coldain
		e.other:Faction(42, -20); --cov
		e.other:SummonItem(25051); --Legs of Deaen Greyforge
	end

	item_lib.return_items(e.self, e.other, e.trade)	
end
