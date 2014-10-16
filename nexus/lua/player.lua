function event_enter_zone(e)
	eq.set_timer("1",30000);
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);
	if((qglobals["antonica_port"] == 1) and (qglobals["nexus_ant"] == 1)) then
		eq.SelfCast(2708); --antonica
		eq.set_global("nexus_ant","0",5,"S60");
		qglobals.nexus_ant = nil;
		qglobals.antonica_port = nil;
		--nexus_ant = nil;
		--antonica_port = nil;
	elseif((qglobals["faydwer_port"] == 1) and (qglobals["nexus_fay"] == 1)) then
		eq.SelfCast(2706); --faydwer
		eq.set_global("nexus_fay","0",5,"S60");
		qglobals.nexus_ant = nil;
		qglobals.antonica_port = nil;
		--nexus_fay = nil;
		--qglobals["faydwer_port"] = nil;
	elseif((qglobals["odus_port"] == 1) and (qglobals["velious_port"] == nil) and (qglobals["nexus_vos"] == 1)) then
		eq.SelfCast(2707); --odus
		eq.set_global("nexus_vos","0",5,"S60");
		qglobals.nexus_vos = nil;
		qglobals.odus_port = nil;
		--qglobals["nexus_vos"] = nil;
		--qglobals["odus_port"] = nil;
	elseif((qglobals["velious_port"] == 1) and (qglobals["odus_port"] == nil) and (qglobals["nexus_vos"] == 1)) then
		eq.SelfCast(2062); --velious
		eq.set_global("nexus_vos","0",5,"S60");
		qglobals.nexus_vos = nil;
		qglobals.velious_port = nil;
		--qglobals["nexus_vos"] = nil;
		--qglobals["velious_port"] = nil;
	elseif((qglobals["kunark_port"] == 1) and (qglobals["nexus_kun"] == 1)) then
		eq.SelfCast(2709); --kunark
		eq.set_global("nexus_kun","0",5,"S60");
		qglobals.nexus_kun = nil;
		qglobals.kunark_port = nil;
		--qglobals["nexus_kun"] = nil;
		--qglobals["kunark_port"] = nil;
	elseif((qglobals["velious_port"] == 1) and (qglobals["odus_port"] == 1) and (qglobals["nexus_vos"] == 1)) then
		e.self:Message(15,"The Odus and Velious port is very volatile, and often misplaces people. Feel lucky you ended up back here! You should be ported properly next cycle. We're sorry for the inconvenience!");
		eq.SelfCast(2433); --unlikely but could happen. send to nexus.
		eq.set_global("nexus_vos","0",5,"S60");
		qglobals.nexus_vos = nil;
		qglobals.velious_port = nil;
		qglobals.odus_port = nil;
		--qglobals["nexus_vos"] = nil;
		--qglobals["velious_port"] = nil;
		--qglobals["odus_port"] = nil;
	end
	
	--qglobals["nexus_ant"] = nil;
	--qglobals["antonica_port"] = nil;
	--qglobals["nexus_fay"] = nil;
	--qglobals["faydwer_port"] = nil;
	--qglobals["nexus_vos"] = nil;
	--qglobals["odus_port"] = nil;
	--qglobals["velious_port"] = nil;
	--qglobals["nexus_kun"] = nil;
	--qglobals["kunark_port"] = nil;
	
	qglobals.nexus_ant = nil;
	qglobals.antonica_port = nil;
	qglobals.nexus_fay = nil;
	qglobals.faydwer_port = nil;
	qglobals.nexus_vos = nil;
	qglobals.odus_port = nil;
	qglobals.velious_port = nil;
	qglobals.nexus_kun = nil;
	qglobals.kunark_port = nil;
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
