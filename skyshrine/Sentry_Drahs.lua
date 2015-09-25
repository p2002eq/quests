function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I would be careful wandering the maze. Many have gotten lost and never come out the other end.");
	end

end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end