function event_say(e)
	if(e.message:findi("hail")) then

		e.self:Say("Oh hello there! I'm sorta new here so I ask ye to be patient with me heheh. What kin I get fer ya, "..e.other:GetName().."");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
