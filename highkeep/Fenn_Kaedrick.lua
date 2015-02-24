function event_spawn(e)
	eq.set_timer("depop", 1800000); --Despawn after 30 minutes
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Say("What brings you to the top of the castle? Me? I am just the Highkeep exterminator. We have had a nasty time with rats.");
	end
	if(qglobals["FennKaedrick"] == "1") then
		if( e.message:findi("xentil herkanon")) then
			e.self:Say("Xentil Herkanon is related to one of the bigwigs of the Circle of Unseen Hands, the rogue guild in Qeynos. Killing him would greatly decrease your popularity with them, but who do they like, anyway? He travels with two bodyguards, Lartin and Grex, very tough customers. It's best to avoid them. Goodbye and good luck.");
			eq.unique_spawn(6185, 0, 0, -258, -102, 4, 16);			--Xentil Herkanon
			eq.unique_spawn(6186, 0, 0, -259, -78, 4, 0); 			--Lartin
			eq.unique_spawn(6187, 0, 0, -240, -78, 4, 0); 			--Grex
			eq.delete_global("FennKaedrick");
			eq.stop_timer("depop");
			eq.depop();
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12185})) then 		--Useless Coin
		e.self:Say("So you are the one Laren sent. I myself was trained by Laren. Imagine that, a human trained by elven rogues. I share the concerns of the scouts. You were sent to assassinate [Xentil Herkanon]. He betrayed the scouts and Kelethin. He is somewhere in this keep. Return his head to Laren in Kelethin.");
		eq.set_global("FennKaedrick","1",5,"M30");
		e.other:AddEXP(2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
