function event_say(e)
	if(e.message:findi("hail")) then	
		e.self:Say("The finest ore fresh from the mines I have! Take a look, why don't ye, "..e.other:GetName()..". I'm sure I've got somethin' ye be needin'.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
