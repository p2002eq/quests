function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello... %s!",e.other:GetCleanName()));
	elseif(e.message:findi("end")) then
		eq.unload_encounter("RingTen");
		e.self:Say("RingTen unload fired.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30369})) then -- 9th ring
		e.self:Say("Ring turned in")
		e.other:Ding();
		e.other:AddEXP(20000);
		e.other:SummonItem(30369)
		eq.load_encounter("RingTen");
		e.self:Say("RingTen load fired.");
		eq.spawn2(152018, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
		eq.spawn2(118354, 0, 0, e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading())
		eq.depop()
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end


function event_death_complete(e)
	eq.unload_encounter("RingTen");
	eq.zone_emote(14, 'RingTen UNLOADED');
end
