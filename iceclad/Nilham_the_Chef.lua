-- Captain Nalot's Triple Strength Rum
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahoy, " .. e.other:GetName() .. ". Welcome ta the brig. I didn't get ta the 'B' section of my piratisms manual so I'm not sure what a brig is but I'm guessin' it means 'really small place without enough food or water.' So, ya here ta stay or just visitin'?");
	elseif(e.message:findi("What cat")) then
		e.self:Say("That was a nasty cat. I dun think it was after us, though. I think it just smelled the fresh chunk of wooly rhino jerky I had. It didn't do anythin' but knock us over. I guess that's what it likes, walrus. After it knocked us over it slipped away towards the bridge island like a ghostly mist. I'm thinkin I saw a glimmer in its maw while it was runnin off.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18962})) then -- Pirate Grammar Manual
		e.self:Emote("looks at you with a gleam in his eye.");
		e.self:Say("Wow. Ya actually got one. Thanks, mate! Here, you can have my cuffs. I'm tired of 'em and they're startin' ta chafe.");
        e.self:Say("B - Bilgewater. Barnacle brained blunderhead. Blast yer ballast...");
        e.self:Emote("happily reads through the book.");
        e.other:QuestReward(e.self,0,0,0,0,30041,10000); -- Ice Forged Shackles
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end