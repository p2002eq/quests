--Elder_Poxbourne (203374)  Thelin Poxbourne
--Terris Thule/Plane of Nightmare Planar Progression
--potranquility

-- Pre-flags required:  
-- None

-- Flagging Steps:
-- (1) qglobals.pop_pon_hedge_jezith (1) -- Spoken to Jezith in PoTranq (Pre-Flag)
-- (2) qglobals.pop_pon_construct (1) -- Killed Construct of Nightmares (PoNB - Terris Lair Flag)
-- (3)qglobals.pop_ponb_terris (1) -- Killed Terris Thule
-- (4)qglobals.pop_ponb_poxbourne (1) -- Spoken to Poxbourne after killing Terris (Completed PoNightmares)

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	--adjust flags for players who completed hedge or killed Terris but somehow missed construct flag (should not be possible)
	if (qglobals.pop_ponb_terris ~= nil) or (qglobals.pop_pon_construct > 1) then	
		eq.set_global("pop_pon_construct", "1", 5, "F");
	end

	if(e.message:findi("hail") and qglobals.pop_pon_hedge_jezith ~= nil and qglobals.pop_pon_construct ~= nil and qglobals.pop_ponb_terris ~= nil) then
		e.other:Message(7,"Thelin tells you, 'I apologize but I cannot stand to greet you. I am still quite weak and recovery will be a long and painful road, though it is a most welcome venture. I want you to know how much I appreciate your bravery in helping me. I am forever in your debt.'");
		if qglobals.pop_ponb_poxbourne == nil then
			eq.set_global("pop_ponb_poxbourne", "1", 5, "F");
			e.other:Message(15,"You've received a character flag!");
		end
	elseif e.message:findi("hail") then
		e.other:Message(7,"Thelin tosses and turns violently on the floor, then is still.");
		eq.signal(203366,1);	--Adroha_Jezith (203366)
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end