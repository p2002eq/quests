-- vulak, summons all named dragons within inner TOV
function event_spawn(e)
	e.self:Shout("Aid me my children!");
	local dragons = {124010, 124008, 124011, 124074, 124072, 124076, 124077, 124103, 124289};
	for i, dragon in ipairs(dragons) do
		summon_dragon(dragon, e.self:GetX(), e.self:GetY(), e.self:GetZ());
	end
end

function summon_dragon(npcid, x, y, z)
	local mob = eq.get_entity_list():GetMobByNpcTypeID(npcid);
	if(mob) then
		mob:CastToNPC():GMMove(x, y, z);
	end
end