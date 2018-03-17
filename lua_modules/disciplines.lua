local discs = {}

function discs:train_discs(e, cur_level)
	eq.train_discs(cur_level,cur_level);
end

function discs:update_discs(e, cur_level)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals["Discs"] == nil) then
    	eq.train_discs(e.self:GetLevel(),51);
    	eq.set_global("Discs","1",5,"F");
	end
end

return discs;

