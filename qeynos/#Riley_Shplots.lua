---- Quest:Investigators Badge (Badge #1)
-- QGlobal Helpers for Badge Quest #1 (qeynos_badge1)
-- 1 = Received Investigator's Briefing
-- 2 = First Suspect
-- 3 = Rileys Confession
-- 4 = Summoned Guard for Riley
-- 5 = Willies Confession
-- 6 = Summoned Guard for Willie
-- 7 = Have the Investigators Badge
-- Failure of the an_investigator section will reset you back to QGlobal 1 so you can restart the escort portion

function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_say(e)
	if(e.message:findi("bloodsaber")) then
		e.self:Emote("shakes visibly and says, 'Oh, no. I knew this would happen one day. Please don't hurt me! I had very little to do with this plague, though it is quite a nice one, you must admit. I was just a courier. I'll come quietly. I don't want any trouble. My small contribution to the glory of Bertoxxulous has already been given but I certainly don't want to go to meet him just yet!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2344})) then -- Confession Document
		e.other:SummonItem(2369); -- Rileys Confession
		eq.unique_spawn(120.01,0,0,-414,-11,-25,0); -- #Willie_Garrote
		eq.set_global("qeynos_badge1","3",5,"F"); -- Badge Globals
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end

function event_signal(e)
	if(e.signal == 1) then
		eq.start(65);
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end
