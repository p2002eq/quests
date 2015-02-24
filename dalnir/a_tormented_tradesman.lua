--The tormented tradesman is actually the skeleton/spirit of the Haggle Baron, Dalnir. Giving this skeleton the Mirror of Self Loathing will spawn Haggle Baron Dalnir so you can finish the Greenmist quest.
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 3889})) then --Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Emote("The undead entity looks in the mirror and appears to be stunned by the memory of his former self. He drops the mirror, which causes it to crack slightly. You immediately grab it and place it back in your bag. The spirit looks at you and begins to transform. Ethereal strands of muscle, blood, and flesh come together and the Haggle Baron Dalnir appears.");
		e.other:QuestReward(e.self,0,0,0,0,3896);
		eq.spawn2(104075,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3896})) then --Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Emote("The undead entity looks in the mirror and appears to be stunned by the memory of his former self. He drops the mirror, which causes it to crack slightly. You immediately grab it and place it back in your bag. The spirit looks at you and begins to transform. Ethereal strands of muscle, blood, and flesh come together and the Haggle Baron Dalnir appears.");
		e.other:Ding();
		eq.spawn2(104075,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
