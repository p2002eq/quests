function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahoy, " .. e.other:GetName() .. ". Welcome ta the brig. I didn't get ta the 'B' section of my piratisms manual so I'm not sure what a brig is but I'm guessin' it means 'really small place without enough food or water.' So, ya here ta stay or just visitin'?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18962})) then
		e.self:Emote("looks at you with a gleam in his eye.");
		e.self:Say("Wow. Ya actually got one. Thanks, mate! Here, you can have my cuffs. I'm tired of 'em and they're startin' ta chafe.");
        e.self:Say("B - Bilgewater. Barnacle brained blunderhead. Blast yer ballast...");
        e.self:Emote("happily reads through the book.");
        e.other:QuestReward(e.self,0,0,0,0,30041,10000);
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end