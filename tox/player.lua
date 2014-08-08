function event_timer(e)
	if(eq.get_qglobals(e.self).nexus_tox ~= nil and eq.get_qglobals(e.self).spire_tox ~= nil and eq.get_qglobals(e.self).spire_tox == "1" and e.self:HasItem(19720)) then
		eq.SelfCast(2433); -- self only to avoid AE
		eq.set_global("spire_tox","0",1,"F");
		eq.del_global("message_tox");
		e.self:NukeItem(19720) -- removes stone from inventory.
		nexus_tox = nil;
		spire_tox = nil;
		message_tox = nil;
	elseif(eq.get_qglobals(e.self).nexus_tox ~= nil and eq.get_qglobals(e.self).spire_tox ~= nil and eq.get_qglobals(e.self).spire_tox == "1" and eq.get_qglobals(e.self).message_tox == nil and e.self:HasItem(19720) == false) then
		e.self:Message(15, "You don't have the correct component to travel to Luclin.");
		eq.set_global("message_tox","1",1,"M20"); -- prevent component mssage from being spammed.
		nexus_tox = nil;
		spire_tox = nil;
		message_tox = nil;
	elseif(eq.get_qglobals(e.self).nexus_tox ~= nil and eq.get_qglobals(e.self).spire_tox ~= nil and eq.get_qglobals(e.self).spire_tox == "1" and eq.get_qglobals(e.self).message_tox ~= nil and e.self:HasItem(19720) == false) then
		nexus_tox = nil;
		spire_tox = nil;
		message_tox = nil;
	end
end
