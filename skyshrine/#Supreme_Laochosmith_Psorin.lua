function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is most unfortunate that you do not have scales to defend your fragile mortal shell, $race, I can only hope that the armor we in the Shrine can provide you with will extend your life another fraction of a century. In addition to that you also might want a [special helm] to cover up that scaleless face of yours. I understand that the Mother could not grace you with all our blessings, but at least we can try to make you look half-way decent.");
	elseif(e.message:findi("special helm")) then
		e.self:Say("Using my obviously superior skills I can customize a plate helm from the Shrine to suit a $race such as yourself. Give me your Blood Lord's Crown, Scaled Knight's Helm, Helm of Twilight, Akkirus' Crown of the Risen, Cowl of Mortality, Frostreaver's Velium Crown, Crown of the Kromzek Kings, or Crown of the Myrmidon and I shall make you a new helm that will better hide and protect your unscaled features.");
	end
end

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31140})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(31528);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31119})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(31526);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31133})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(31527);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31098})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(31525);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31182})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(31529);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 26025})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(2612);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25194})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(2611);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30507})) then
		e.self:Say("Thank you, "..e.other:GetName..". Please accept this Helm as a token of our gratitude for your service to the Shrine.");
		e.other:SummonItem(2610);
end

