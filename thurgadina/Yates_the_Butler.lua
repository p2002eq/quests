function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm terribly sorry, good fellow, but this residence is privately owned. Your presence here is quite disconcerting for my master. I implore you to take your leave. Thaaaaanks.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
