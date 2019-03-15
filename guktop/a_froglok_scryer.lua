local flags = false;

function event_spawn(e)
	flags = false;
end

function event_death(e)
	if (flags == false) then
		local hateList = e.self:CastToNPC():GetHateList();
		for mob in hateList.entries do
			local qglobals = eq.get_qglobals(e.self);
			local global = mob.ent:CastToClient():GetForumName(mob.ent:CastToClient():AccountID()) .. "-Scryer19";
			if (qglobals[global] == nil) then
				eq.set_global(global ,"1",7,"F");
				e.self:Say("Froak, not a cage!");
				mob.ent:CastToClient():Message(15,"You have captured a Froglok Scryer!");
				eq.depop_with_timer();
			end		
		end
		flags = true;
	end
end