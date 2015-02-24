function event_spawn(e)
	e.self:Emote("runs up and steals the note. 'Aha!! Foolish Qeynite or whatever you call yourself!! I have found the note and now I shall take it to my superior!! Just try and catch me!!'");
	eq.set_timer("1",10000);
	eq.set_timer("2",600000);
end

function event_timer(e)
	if(e.timer == "1") then
		eq.stop_timer("1");
		eq.start(5);
	elseif(e.timer == "2") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
