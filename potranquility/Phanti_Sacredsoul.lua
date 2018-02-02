--Phanti_Sacredsoul (203431)
--potranquilty

--Quest NPC for Plane of Torment Alt Access - which is currently unavailable on P2002 due to being out of era.

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("moans and sweats.");
		eq.signal(203432,0);	--Iramai_Sacredsoul (203432)
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end



