-- Event_Master_Juvia (202358) in PoK for anniversary quest!

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("I have always loved little events, especially those we threw in Felwithe. My favorites where the fishing tournaments! Say... I need a good fishing lure for this year's games. If you can make me a Shimmering Gossamer Circle Fly, I will give you my seal so we both have a chance at winning something! Make sure to get your skill high enough to make it easily! I will know!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if item_lib.check_turn_in(e.self, e.trade, {item1 = 22726}) then -- Shimmering Gossamer Circle Fly
		if e.other:GetSkill(55) > 50 then
			e.self:Say("You did a fine job. This will surely catch me something big. Here, take this seal and best of luck on your quest!");
			e.other:QuestReward(e.self,0,0,0,0,34043); -- Juvia's Seal 
		else
			e.self:Say('Are you sure no one else made that for you? Go back and practice some more to show me that you can make it yourself.');
			e.other:SummonItem(22726); -- returns Shimmering Gossamer Circle Fly
		end
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
