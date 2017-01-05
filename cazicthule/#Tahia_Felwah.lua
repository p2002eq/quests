-- #Tahia_Felwah, coordinates ring of fear event in CT

local ThreadManager = require("thread_manager");

function event_spawn(e)
	e.self:SetBodyType(11, true);
	ThreadManager:Create("Talking", Talking, e);
	eq.set_timer("TMHB", 1000);
	rune_total = 0
end

function event_timer(e)
	if e.timer == "TMHB" then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("Talking");
	end
end

function Talking(e)
	e.self:Say("Brave adventurers, I am Tahia Felwah, and I owe you my life. I was to be a sacrifice to the faceless. Listen to my words carefully, there isn't much time now.");
	-- ThreadManager:Wait(15);
	eq.zone_emote(1,"The walls of the temple begin to crack as the ground beneath your feet shakes violently");
	e.self:Say("You have interrupted a complicated ritual and soon the rift to the Faceless will become unstable. I must collect three runes of the Faceless for my research. I have been appointed to uncover the source of these lizards' newfound power. If I fail, their kind will surely spread across the land and threaten the balance of Norrath.");
	-- ThreadManager:Wait(15);
	e.self:Say("This failed ritual presents a unique opportunity to gather the runes I desperately need. Recover the runes from the fallen minions of the faceless. When your need is greatest, hand me a rune and I will replenish you and your companions.");
	eq.move_to(590, 1020, -95, 0, true);
	-- ThreadManager:Wait(15);
	eq.zone_emote(1,"An unstable rift glows, and dissipates.");
	eq.zone_emote(1,"A piercing, disembodied scream echos from deep within the temple. Your body begins to tremble uncontrollably with fear.");
	eq.unique_spawn(48381, 0, 0, 587, 1090, -98, 0);
	e.self:Say("Prepare youselves! You must repel the denizens of Fear itself! Good luck brave souls, I will remain here until my task is fulfilled.");
	eq.stop_timer("TMHB");
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8234})) then
		e.other:SpellFinished(2698,e.other,0,0);	-- instant casts it from turn in player because her aoe cast won't land on players.
		rune_total = rune_total + 1;
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
	if rune_total >= 3 then
		eq.depop();
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