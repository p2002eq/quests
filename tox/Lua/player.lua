function event_enter_zone(e)
	-- [FLAG: Check target: eq.get_globals()] local qglobals = eq.get_qglobals();
	eq.set_timer("spires",10000);
	qglobals["nexus_tox"] = nil;
	qglobals["spire_tox"] = nil;
	qglobals["message_tox"] = nil;
end

function event_timer(e)
	-- [FLAG: Check target: eq.get_globals()] local qglobals = eq.get_qglobals();
	if(qglobals["nexus_tox"] ~= niloxend and defined qglobals["spire_tox"] and qglobals["spire_tox"] == 1 and e.other:HasItem( 19720)) then
		eq.SelfCast(2433); --self only to avoid AE
		eq.set_global("spire_tox",0,1,"F");
		eq.delete_global("message_tox");
		e.self:NukeItem(19720); --removes stone from inventory.
		qglobals["nexus_tox"] = nil;
		qglobals["spire_tox"] = nil;
		qglobals["message_tox"] = nil;
	
	elseif(defined qglobals["nexus_tox"] and defined qglobals["spire_tox"] and qglobals["spire_tox"] == 1 and qglobals["nexus_tox"] == nils_toxend and defined qglobals["spire_tox"] and qglobals["spire_tox"] == 1 and !defined qglobals["message_tox"] and !e.other:HasItem( 19720)) then
		e.self:Message(15,"You don't have the correct component to travel to Luclin.");
		eq.set_global("message_tox",1,1,"M20"); --prevent component message from being spammed.
		qglobals["nexus_tox"] = nil;
		qglobals["spire_tox"] = nil;
		qglobals["message_tox"] = nil;
	
	elseif(qglobals["nexus_tox"] ~= nils_toxend and defined qglobals["spire_tox"] and qglobals["spire_tox"] == 1 and defined qglobals["message_tox"] and !e.other:HasItem( 19720)) then
		qglobals["nexus_tox"] = nil;
		qglobals["spire_tox"] = nil;
		qglobals["message_tox"] = nil;
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
