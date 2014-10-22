function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, you have made excellent time. We received word that Zordak was gathering his power here, and we still have little knowledge of his true intentions. Scattered throughout these mountains there are small Pearlescent Shards, binding four of these shards together within a Box of Binding should allow me to create a Seal. This seal, when fused with a Swirling Pearl inside Zordak's heart should allow our seers to divine his true intentions, even after he has been slain. Once you have the seal I will release Zordak, make haste I will not be able to hold him for long.");
		--e.other:SummonItem(17175);
	end
end

function event_trade(e)
	local item_lib = require("items");
	local entid;
	local zordak_mob;
	local mobnpc;
	local dead_cleric_mob;
	if(item_lib.check_turn_in(e.trade, {item1 = 24996})) then -- 24996 :  An Assembled Pearlescent Shard
		e.other:SummonItem(24997); -- 24997  Pearlescent Seal
		entid = eq.unique_spawn(91096,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ()); -- Zordak_Ragefire, human form, he attacks the cleric
		if(entid) then
			zordak_mob = eq.get_entity_list():GetMobID(entid);
			if(zordak_mob) then
				mobnpc = e.self:GetZ()ordak_mob:CastToNPC();
				if(mobnpc) then
					dead_cleric_mob = eq.get_entity_list():GetMob(" .. e.other:GetName() .. ");
					if(dead_cleric_mob) then
						mobnpc:AddToHateList(dead_cleric_mob, 1);
					end
				end
			end
		end
		eq.depop_with_timer();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 20859})) then
		e.other:SummonItem(20859); -- 20859  Swirling Pearl
		e.other:SummonItem(17175); -- 17175  Zordak's Box of Bindings
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
