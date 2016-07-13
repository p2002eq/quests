function event_spawn(e)
	e.self:Say("Brave adventurers, I am Tahia Felwah, and I owe you my life. I was to be a sacrifice to the faceless. Listen to my words carefully, there isn't much time now.");
	eq.set_timer("1", 15000);
end

function event_timer(e)
	if (e.timer == "1") then
		eq.stop_timer("1");
		e.self:Say("You have interrupted a complicated ritual and soon the rift to the Faceless will become unstable. I must collect three runes of the Faceless for my research. I have been appointed to uncover the source of these lizards' newfound power. If I fail, their kind will surely spread across the land and threaten the balance of Norrath.");
		eq.set_timer("2",15000);
	elseif(e.timer == "2") then
		eq.stop_timer("2");
		e.self:Say("This failed ritual presents a unique opportunity to gather the runes I desperately need. Recover the runes from the fallen minions of the faceless. When your need is greatest, hand me a rune and I will replenish you and your companions.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8234})) then
		e.other:SpellFinished(2698,e.other,0,0);	-- instant casts it from turn in player because her aoe cast won't land on players.
	end
end

function event_signal(e)
	if (e.signal == 1) then
		local npc_list = { 48354, 48382, 48383, 48384, 48385, 48386, 48381, 48388};
		for k,v in pairs(npc_list) do
			eq.depop_all(v);
		end
	end
end