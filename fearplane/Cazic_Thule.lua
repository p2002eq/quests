function event_spawn(e)
	eq.set_timer("Shout",600000);
end

function event_say(e)
	if(e.message:findi("gandan has failed in his task")) then
		e.self:Emote("'s thoughts begin to pervade your own, they creep into your mind with great force. You feel pressure as if your head will explode. You see his thoughts becoming your own. You see in these visions a tome bound in flesh dropped to the ground. You then open your eyes to see that same book, and take it knowing that it was meant for you.");
		e.other:SummonItem(18898);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 8226, item2 = 18898, item3 = 18899})) then
		e.self:Emote("seems pleased with the amount of pain that you have been able to inflict. Cazic Thule then grabs your hands and begins to infuse them with his power. Your hands burn like they were placed in lava for a moment, then feel cool as ice. You can feel the sheer power flowing through your new weapons of pain.");
		e.other:SummonItem(7836);
		e.other:AddEXP(100000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Shout("Denizens of Fear, your master commands you to come forth to his aid!!");
		eq.signal(72000,1,0);
		eq.signal(72004,1,0);
		eq.signal(72002,1,0);
		local dread_mob = eq.get_entity_list():GetMobByNpcTypeID(72000);
		local fright_mob = eq.get_entity_list():GetMobByNpcTypeID(72004);
		local terror_mob = eq.get_entity_list():GetMobByNpcTypeID(72002);
		if(dread_mob) then
			local dread_mobnpc = dread_mob:CastToNPC();
			dread_mobnpc:AddToHateList(e.other, 1);
		end
		if(fright_mob) then
			local fright_mobnpc = fright_mob:CastToNPC();
			fright_mobnpc:AddToHateList(e.other, 1);
		end
		if(terror_mob) then
			local terror_mobnpc = terror_mob:CastToNPC();
			terror_mobnpc:AddToHateList(e.other, 1);
		end
	end
end

function event_timer(e)
	if(e.timer == "Shout") then
		e.self:Shout("Beware all infidels who dare to taint my plane, for I shall rend your minds with fright, dread, and terror!");
		eq.signal(72000,0,0);
		eq.signal(72002,0,0);
		eq.signal(72004,0,0);
		eq.signal(72012,0,0);
		eq.signal(72015,0,0);
		eq.signal(72198,0,0);
		eq.signal(72022,0,0);
		eq.signal(72029,0,0);
		eq.signal(72031,0,0);
		eq.signal(72036,0,0);
		eq.signal(72052,0,0);
		eq.signal(72055,0,0);
		eq.signal(72058,0,0);
		eq.signal(72061,0,0);
		eq.signal(72065,0,0);
		eq.signal(72067,0,0);
		eq.signal(72076,0,0);
		eq.signal(72081,0,0);
		eq.signal(72094,0,0);
		eq.signal(72103,0,0);
	end
end

--(Aggro) Created by Mystic414, (Say, Item, Spawn and Timer) Additions by Jim Mills
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
-- Call Dread, Fright & Terror to aid Cazic Thule if they're still alive
-- code by mystic414
--
-- Cazic Thule also administers the Whistling Fists quest for iksar monks
