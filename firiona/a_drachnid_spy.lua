--The drachnid spy is for the fifth quest in the Greenmist line. Once killed, he'll drop the Charasis Tome that we need.
function event_spawn(e)
	eq.set_timer("depop", 1800000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks upon you with evil eyes and you hear a horrid chatter. Hairs rise from the spider's thorax. 'Greetings, creature. What a fine meal you would make!'");
		eq.attack(e.other:GetName());
		e.self:Say("You shall not take the tome from me!! I shall snack upon your blood-drained corpse.");
	end
end

function event_death_complete(e)
	eq.signal(84412,1);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end