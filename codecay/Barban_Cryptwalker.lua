function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local instance_id = eq.get_instance_id();
	if e.message:findi("Hail") and tonumber(qglobals.pop_cod_preflag) == 1 then
		e.self:Say("You believe you can [" .. eq.say_link("challenge Bertoxxulous") .. "], mortal?");
	elseif e.message:findi("challenge Bertoxxulous") and tonumber(qglobals.pop_cod_preflag) == 1 then
		e.self:Say("Give the Crypt Lord my regards");
		e.other:MovePCInstance(200,instance_id,0,-16,-289,256);
	end
end
