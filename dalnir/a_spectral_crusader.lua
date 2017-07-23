function event_say(e)
	if(e.message:findi("greenmist")) then
		e.self:Say("Mighty was the mist which covered the land. Mighty is the blade wielded by a crusader.");
	elseif(e.message:findi("golin")) then
		e.self:Emote("swipes his hand toward his own head in a chopping motion. 'Stuck between crypt and dust.'");
	elseif(e.message:findi("visceral dagger")) then
		e.self:Say("Shattered!! Three within the crypt. A master must go. To the [" .. eq.say_link("grand forge") .. "] they must go. Three become one with the spirit hammer.");
	elseif(e.message:findi("grand forge")) then
		e.self:Emote("points to the ground. 'Beyond the doors lies a forge unlike any other.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end