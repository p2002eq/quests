local flags = false;

function event_death(e)
	if (flags == false) then
		local hateList = e.self:CastToNPC():GetHateList();
		for mob in hateList.entries do
			local qglobals = eq.get_qglobals(e.self);
			local global = mob.ent:CastToClient():GetForumName(mob.ent:CastToClient():AccountID()) .. "-CaveLord";
			if (qglobals[global] == nil) then
				eq.set_global(global ,"1",7,"F");
				mob.ent:CastToClient():Message(15,"You have captured a cave_bat_lord!");
				eq.depop_with_timer();
			end		
		end
		flags = true;
	end
end