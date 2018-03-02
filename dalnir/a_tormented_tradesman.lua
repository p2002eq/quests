-- Greenmist
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("End my suffering... I cannot think beyond this pain! Why am I in this place? What have I done?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3889})) then -- Mirror of Self-loathing
		eq.signal(104072,1); -- The undead entity
		e.other:QuestReward(e.self,0,0,0,0,3896,100); -- Cracked Mirror of Self-Loathing
		eq.spawn2(104165,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Haggle Baron Dalnir
		eq.depop_with_timer();
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3896})) then -- Cracked Mirror of Self-Loathing
		eq.signal(104072,1); -- The undead entity
		e.other:QuestReward(e.self,0,0,0,0,0,1000); -- EXP
		eq.spawn2(104165,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Haggle Baron Dalnir
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end