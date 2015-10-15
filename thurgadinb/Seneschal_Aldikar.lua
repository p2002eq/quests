function event_say(e)
	if(e.other:GetFaction(e.self) <= 4) then --Amiable or lower
		if(e.message:findi("hail")) then	
			e.self:Say("And a good day to you, "..e.other:Race()..". I must say that i'm impressed that your people were even able to make it to our continent, let alone survive the frigid temperatures of it. I am Seneschal Aldikar, Commander of the Armies of Thurgadin, known by some as the Sword of the Dain. My armies are currently undergoing intensive training and are ready for a full assault on Kael Drakkel as soon as his majesty gives the order.");
		end
	else
		if(e.message:findi("I will accept this task")) then	
			e.self:Say("In this box, place the accursed dirk of the fallen Rodrick. With it combine the heads of every traitor you dispose of. When this is done give the box and the velium insignia ring to the Dain directly. On behalf of the crown and all good Coldain, I thank you ... May Brell be with you.");
		e.other:SummonItem(17055); --Traitors Bane Box
		end
	end
	
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
