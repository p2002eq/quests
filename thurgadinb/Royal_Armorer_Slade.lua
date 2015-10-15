function event_say(e)
	if(e.other:GetFaction(e.self) <= 3) then --Warmly or lower
		if(e.message:findi("hail")) then	
			e.self:Say("Welcome, "..e.other:GetName()..". I'm Slade, Royal Armorer to the Dain and his personal guardsmen. I've heard yer name once or twice in these halls and apparently ye've earned the respect of my people. In light of that I'm willin ta offer my [services] to you if'n ye need them.");
		elseif(e.message:findi("services")) then	
			e.self:Say("If'n ye've had the fortune to earn any of the plate helms that are made by my people in the city then I can use my skills to custom fit and detail it for a "..e.other:Race().." of yer like. I can do this fer the Dark Runed Crown, the Runed Protector's Helm, the Resonant Helm, the Crown of Forbidden Rites, Crown of the Kromzek Kings, Frostreaver's Velium Crown, Cowl of Mortality, and the Champions Crown. Simply hand me one of these and I'll do the work for you.");
		end
	else
		e.self:Say("I do not know you well enough to entrust you with my skills.");
	end
end

function event_trade(e)
	local item_lib = require('items');

	if(e.other:GetFaction(e.self) <= 3) then --Warmly or lower
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31084})) then
			e.other:SummonItem(31519); --Custom Champions Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 26025})) then		
			e.other:SummonItem(2612); --Custom cowl of mortality
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31042})) then			
			e.other:SummonItem(31518); --Custom cowl of forbidden rites
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31000})) then	
			e.other:SummonItem(31515); --Custom Dark Runed Crown 
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30507})) then	
			e.other:SummonItem(2610); --Custom Frostweavers Velium Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31035})) then	
			e.other:SummonItem(31517); --Custom Resonant Helm
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31021 })) then	
			e.other:SummonItem(31516); --Custom Runed Protector's Helm
		end
		e.self:Say("Here you are "..e.other:GetName()..". Ah, a perfect fit! May it serve you well.");
	else
		e.self:Say("I do not know you well enough to entrust you with such an item, yet.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
		
end

