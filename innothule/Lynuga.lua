function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hrrump?! Who you? " .. e.other:GetName() .. "? What you want with Lynuga? Me am out [" .. eq.say_link("collecting") .. "]. Leave me be!");
	elseif(e.message:findi("collecting")) then
		e.self:Say("I collect all sort's of thing's. Gem's be my favorite. Me really like rubies. If you have ruby, give to me! Why you want to know? You want to steal my collection?!? I squish you if you do!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10035})) then -- Handin: Ruby
		e.self:Say("Mmm. Ruby!! Me thank's you! Here take this, me got it off dead someone who try take my collection. Me think's this valuable thing..");
		local item_random = math.random(100);
		if item_random < 10 then
			e.other:SummonItem(10082, 6); -- Ivandyr's Hoop
		elseif item_random < 50 then
			e.other:SummonItem(10080); -- Brutechopper
		else
			e.other:SummonItem(10081, 5); -- Midnight Mallet
		end
		e.other:Ding();
		e.other:Faction(22,5,0);
		e.other:Faction(292,-5,0);
		e.other:Faction(66,-5,0);
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF