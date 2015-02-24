--BeginFile: rivervale\Ace_Slighthand.pl
--Quest file for Rivervale - Ace Slighthand: Kevlin Diggs' Debt & Extraordinary Rodents

function event_say(e)
	local level = e.other:GetLevel();

	if(e.message:findi("Hail")) then
			e.self:Say("Hey, hey, hey! Welcome to the Fool's Gold. Don't bet more than you can afford to lose, pal! You don't want to end up like ol' [Kevlin]. If you're looking for something to do after you have a drink, you may be interested in a [task].");
	elseif(e.message:findi("kevlin")) then
		e.self:Say("Kevlin Diggs. His family sells armor here in Rivervale. He has a nice shop right across from us here. But he owes us Deeppockets some [gold] that we need to collect. We can't rough him up because he is a friend of Mayor Gubbin. We need someone to steal it.");
	elseif(e.message:findi("gold")) then
		e.self:Say("He keeps his money in a sack on his bed. But he has a mean pet wolf, named Mangler, who mangled the last cutpurse we sent after it. If you were to wait until he leaves his shop, then sneak past Mangler and bring me the money he owes us, I will make it worth your time.");
	end
end

function event_trade(e)
local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13182})) then --Kevlin's Debt
		e.self:Say("Heh heh! You got a career ahead of ya kid! Good work. Here is your cut.");
		e.other:AddEXP(300);
		e.other:Ding();
		e.other:GiveCash(4,10,0,0);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

--END of FILE Zone:rivervale  ID:19093 -- Ace_Slighthand