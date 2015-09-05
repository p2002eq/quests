function event_say(e)
	if(e.message:findi("hail") then 
		if	e.self.Say("Halt who goes there? Hmmm. What manner of strangers are you? Let it be known the Kin hold no love for outsiders, only the truly worthy may walk amongst the Kin.");
		elseif (e.other:GetFaction(e.self) < 4) then -- Less than amiable
			e.self.Say("Be quick for the Guardians may not appreciate you leaving your post.");
		end
	end
end
		
function event_trade(e)
	local helms = 0;
	local mercAssigments = 0;
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062, item3 = 29062, item4 = 29062})) then
		helms = 4;
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062, item3 = 29062})) then
		helms = 3;
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062})) then
		helms = 2;
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29062}))
		helms = 1;
	end
	
	if (helms > 0) then
		repeat
			e.self.Say("Very good, you are on your way to proving yourself.");
			e.self:Faction(42, 5); --CoV
			e.self:Faction(362,5); --Yelinak
			e.self:Faction(189, -5); --Kromzek
			helms = helms - 1;
		until helms == 0
	end
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 29624, item2 = 29624, item3 = 29624, item4 =29624})) then
		mercAssigments = 4;
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29624, item2 = 29624, item3 = 29624})) then
		mercAssigments = 3;
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 29624, item2 = 29624})) then
		mercAssigments = 2;
	elseif (item_lib.check_turn_in(e.self, e.trade. {item1 = 29624})) then
		mercAssigments = 1;
	end
	
	if (mercAssigments > 0) then
		repeat
			e.self.Say("Ahhh yes! Well done " .. e.other:GetClass() .. ". Here is your reward. Your status with our people grows with each interloper you eradicate.");
			e.other:GiveCash(13,6,6,0); -- 13 Copper, 6 Silver, 6 Gold
			e.self:Faction(42, 5); --CoV
			e.self:Faction(362,5); --Yelinak
			e.self:Faction(189, -5); --Kromzek
			mercAssigments = mercAssigments - 1;
		until mercAssigments == 0
	end
	item_lib.return_items(e.self, e.other, e.trade)
end



