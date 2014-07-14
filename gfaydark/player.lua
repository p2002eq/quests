function event_timer(e)
	if(eq.get_qglobals(e.self).nexus_gf ~= nil and eq.get_qglobals(e.self).spire_gf ~= nil and eq.get_qglobals(e.self).spire_gf == "1" and e.self:HasItem(19720)) then
		eq.SelfCast(2433); -- self only to avoid AE
		eq.set_global("spire_gf","0",1,"F");
		eq.del_global("message_gf");
		e.self:NukeItem(19720) -- removes stone from inventory.
		nexus_gf = nil;
		spire_gf = nil;
		message_gf = nil;
	elseif(eq.get_qglobals(e.self).nexus_gf ~= nil and eq.get_qglobals(e.self).spire_gf ~= nil and eq.get_qglobals(e.self).spire_gf == "1" and eq.get_qglobals(e.self).message_gf == nil and e.self:HasItem(19720) == false) then
		e.self:Message(15, "You don't have the correct component to travel to Luclin.");
		eq.set_global("message_gf","1",1,"M20"); -- prevent component mssage from being spammed.
		nexus_gf = nil;
		spire_gf = nil;
		message_gf = nil;
	elseif(eq.get_qglobals(e.self).nexus_gf ~= nil and eq.get_qglobals(e.self).spire_gf ~= nil and eq.get_qglobals(e.self).spire_gf == "1" and eq.get_qglobals(e.self).message_gf ~= nil and e.self:HasItem(19720) == false) then
		nexus_gf = nil;
		spire_gf = nil;
		message_gf = nil;
	end
end
