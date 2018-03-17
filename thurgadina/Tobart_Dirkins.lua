function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and welcome to the Broken Glacier, "..e.other:GetName()..". Ye'll find the bar downstairs and comfortable rooms up top. Can I interest you in one of our signature mugs, only a platinum piece they are!");
	end	
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
