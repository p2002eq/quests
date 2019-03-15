local stolen = false;

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 25, e.self:GetX() + 25, e.self:GetY() - 25, e.self:GetY() + 25, e.self:GetZ() - 5, e.self:GetZ() + 5);
	eq.set_timer("proximity",1000);
	stolen = false;
end

function event_timer(e)
	if (e.timer == "proximity") then
		eq.clear_proximity();
		eq.set_proximity(e.self:GetX() - 25, e.self:GetX() + 25, e.self:GetY() - 25, e.self:GetY() + 25, e.self:GetZ() - 5, e.self:GetZ() + 5);
	elseif (e.timer == "illusion") then
		e.self:SetRace(0);
		stolen = false;
	end
end

function event_enter(e)
	local qglobals = eq.get_qglobals(e.self);
	local global = e.other:CastToClient():GetForumName(e.other:CastToClient():AccountID()) .. "-OddMole19";
	if (qglobals[global] == nil) then
		if (stolen == false) then
			eq.set_global(global,"1",7,"F");
			e.self:SetRace(500);
			e.self:Say("NOOOOO, my illusion!");
			e.other:Message(15,"You have stolen an odd moles illusion!");
			eq.set_timer("illusion",600000);
			stolen = true;
		end
	end
end