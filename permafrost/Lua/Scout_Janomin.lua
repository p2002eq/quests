function event_say(e)
	
	if(e.message:findi("hail")) then
		e.self:Say("It is a comfort to meet you, " .. e.other:GetName() .. ". I was afraid that you might not be able to track me with weather out there being what it is. I must admit that my fondness of the snow is at an all time low right now. The sooner you release the spirit that resides in here, the sooner we can make a way back to a warmer climate.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9031})) then
		e.self:Say("The spirit that you seek is deep within these halls. I tracked it into this lair more than a week ago. The spirit has taken up residence with the other bears in the lower chambers during that time. It should be relatively easy for your and your people to reach. Once you release the spirit, please return the totem to me. I will prepare it for the journey to Shar Vahl. May stealth and good fortune move with you.");
		e.other:SummonItem(9031);
		e.self:Emote("A large creature growls from deep within its icy lair.");
		eq.spawn2(73107,0,0,-275,700,-38,0);
	end
	
	if(item_lib.check_turn_in(e.trade, {item1 = 9036})) then
		e.self:Say("Perfect work, " .. e.other:GetName() .. "! I am glad the Elders made such a wise choice in sending you. I must admit, I was rather scared during the exploration of these halls. This lair is quite foul, quite foul indeed! Take this wrapped totem and place it in the case that you were given. Once you have all of the totems, seal the case and make your way back to Shar Vahl. I work my way back as well. Thank you again. ");
		e.other:SummonItem(9037);
		e.other:SummonItem(9031);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
