-- Corbin in Ring War event in GD

function event_spawn(e)
	ready = false;
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello outlander. Thank you for your help!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if ready and item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}) then -- Shorn Head of Narandi
		e.self:Emote(string.format("unhooks a glowing earring from Narandi's shorn head, 'Hmm, this looks like something special. Take it, %s, you've earned it! Be well.'",e.other:GetCleanName()));
		e.other:Faction(49, 25); --Coldain
		e.other:Faction(67, 10); --Dain
		e.other:Faction(188, -40); --Kromrif
		e.other:Faction(189, -20); --Kromzek
		e.other:SummonItem(1741); -- Shorn head
		e.other:QuestReward(e.self, 0, 0, 0, 0, 1744, 100000); -- reward and XP
		eq.depop();
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if e.signal == 105 then
		ready = true;
	end
end