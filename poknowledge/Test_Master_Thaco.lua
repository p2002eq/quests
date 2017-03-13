-- Test_Master_Thaco (202357) in PoK for anniversary quest!

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Keeping up with testing takes a lot of time and patience. Even the most relaxed individuals need something a little ‘extra' to keep them going, know what I'm saying. How about mixing me up some Othmir Beach Wine so I can enjoy myself while I get through all these changes.  I don't trust anyone else to make it, so be sure to have the appropriate skill to do it yourself!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if item_lib.check_turn_in(e.self, e.trade, {item1 = 19186}) then -- Othmir Beach Wine
		if e.other:GetSkill(65) > 50 then
			e.self:Say("Yeah, this will hit the spot, here is my seal, I think you will find it comes in handy.");
			e.other:QuestReward(e.self,0,0,0,0,34046); -- Thaco's Seal 
		elseif
			e.self:Say('Are you sure no one else made that for you? Go back and practice some more to show me that you can make it yourself.');
			e.other:SummonItem(19186); -- returns Othmir Beach Wine
		end
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
