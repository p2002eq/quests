function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome! You are at the southern gates of the grand city of Shar Vahl. All hail our noble King Raja Kerrath. Long live the king!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
