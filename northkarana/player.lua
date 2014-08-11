function event_enter_zone(e)
	eq.set_timer("spires",10000);
end

function event_timer(e)
	if(eq.get_qglobals(e.self).nexus_gf ~= nil and eq.get_qglobals(e.self).spire_nk ~= nil and eq.get_qglobals(e.self).spire_nk == "1" and e.self:HasItem(19720)) then
		eq.SelfCast(2433); -- self only to avoid AE
		eq.set_global("spire_nk","0",1,"F");
		eq.del_global("message_nk");
		e.self:NukeItem(19720) -- removes stone from inventory.
		nexus_gf = nil;
		spire_nk = nil;
		message_nk = nil;
	elseif(eq.get_qglobals(e.self).nexus_gf ~= nil and eq.get_qglobals(e.self).spire_nk ~= nil and eq.get_qglobals(e.self).spire_nk == "1" and eq.get_qglobals(e.self).message_nk == nil and e.self:HasItem(19720) == false) then
		e.self:Message(15, "You don't have the correct component to travel to Luclin.");
		eq.set_global("message_nk","1",1,"M20"); -- prevent component mssage from being spammed.
		nexus_gf = nil;
		spire_nk = nil;
		message_nk = nil;
	elseif(eq.get_qglobals(e.self).nexus_gf ~= nil and eq.get_qglobals(e.self).spire_nk ~= nil and eq.get_qglobals(e.self).spire_nk == "1" and eq.get_qglobals(e.self).message_nk ~= nil and e.self:HasItem(19720) == false) then
		nexus_gf = nil;
		spire_nk = nil;
		message_nk = nil;
	end
end
