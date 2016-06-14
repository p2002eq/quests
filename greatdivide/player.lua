function event_enter_zone(e)
	eq.set_timer("spires",10000);
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_timer(e)
	if(eq.get_qglobals(e.self).nexus_gd ~= nil and eq.get_qglobals(e.self).spire_gd ~= nil and eq.get_qglobals(e.self).spire_gd == "1" and e.self:HasItem(19720)) then
		eq.SelfCast(2433); -- self only to avoid AE
		eq.set_global("spire_gd","0",1,"F");
		eq.del_global("message_gd");
		e.self:NukeItem(19720) -- removes stone from inventory.
		nexus_gd = nil;
		spire_gd = nil;
		message_gd = nil;
	elseif(eq.get_qglobals(e.self).nexus_gd ~= nil and eq.get_qglobals(e.self).spire_gd ~= nil and eq.get_qglobals(e.self).spire_gd == "1" and eq.get_qglobals(e.self).message_gd == nil and e.self:HasItem(19720) == false) then
		e.self:Message(15, "You don't have the correct component to travel to Luclin.");
		eq.set_global("message_gd","1",1,"M20"); -- prevent component mssage from being spammed.
		nexus_gd = nil;
		spire_gd = nil;
		message_gd = nil;
	elseif(eq.get_qglobals(e.self).nexus_gd ~= nil and eq.get_qglobals(e.self).spire_gd ~= nil and eq.get_qglobals(e.self).spire_gd == "1" and eq.get_qglobals(e.self).message_gd ~= nil and e.self:HasItem(19720) == false) then
		nexus_gd = nil;
		spire_gd = nil;
		message_gd = nil;
	end
end