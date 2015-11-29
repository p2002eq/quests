function event_say(e)

	if (e.other:GetFaction(e.self) <= 3) then --kindly or lower
		if (e.message:findi("hail")) then	
			e.self:Say("What do you want from me "..e.other:Race().."? I can only imagine that you are here to ask me to use my obviously superior smithing talents to create some [special helmets] to help protect your obviously frail body.");
		elseif (e.message:findi("special helmets")) then	
			e.self:Say("Just as I suspected "..e.other:Race()..". Using my superior skills I can customize a plate helmet to help better protect you. Give me your Malevolent Crown, Warlord's Crown, Shining Helm, Templar's Crown, Troubadour's Helm, Frostreaver's Velium Crown, Crown of the Kromzek Kings or a Cowl of Mortality and I shall make you a new helm that will better protect you.");
		end

	else
		e.self:Say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you "..e.other:Race().." now begone!");
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (e.other:GetFaction(e.self) <= 3) then --Kindly or lower
		if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25349})) then
			e.other:SummonItem(31520);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25433})) then	
			e.other:SummonItem(31524);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25370})) then	
			e.other:SummonItem(31521);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25391})) then	
			e.other:SummonItem(31523);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25384})) then	
			e.other:SummonItem(31522);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  30507})) then	
			e.other:SummonItem(2610);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25194})) then	
			e.other:SummonItem(2611);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  26025})) then	
			e.other:SummonItem(2612);
		end
		e.self:Say("Here you are "..e.other:Race().." just as I promised. May it guard you well.");
	else

		item_lib.return_items(e.self, e.other, e.trade);	
	end
end
