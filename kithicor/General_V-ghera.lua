function event_say(e)
	if(e.message:findi("Stanos")) then
		e.self:Say("Stanos? Stanos!! That dog, I WILL see him dead for what he cost me. Outcast I am, stripped of my position, my god has forsaken me, blaming ME for the loss of some tome. And you, " .. e.other:GetName() .. ", you have aided him. For that, you will die first. Please, struggle and beg, I do so enjoy watching my victims squirm, and I have little joy left in my life now. If you want my favor, perhaps if you came bearing Stanos' head I would be more forgiving. But I doubt it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28058})) then
		e.self:Say("Life is indeed sweet! Thank you, " .. e.other:GetName() .. ", you have done me a great service this day. Take this, Stanos was kind enough to return it to me, and I have no use for it now. Know that you have the blessing of Innoruuk for this deed! But of course, I leave it to you to leave here alive. A leader has to feed his minions, you know.");
		e.other:Faction(98,10);
		e.other:QuestReward(e.self,0,0,0,0,2475,500000);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end