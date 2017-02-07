---- Event:Shei_Vinitras
--This is the true version of Shei. When aggro'd, 4 adds will spawn. If anyone is killed by this mob, a random mob (of 4 possible) will spawn.
local adds;

function event_spawn(e)
	adds = 0;
end

function event_combat(e)
	if(e.joined == true) then
		if(adds == 0) then
			eq.spawn2(179352,0,0,-1714,1128,19.7,128); -- Xin`Xokra
			eq.spawn2(179355,0,0,-1715,1034,19.7,0); -- Xin`Xakre
			eq.spawn2(179354,0,0,-1771,1126,18.2,82); -- Xin`Xakri
			eq.spawn2(179353,0,0,-1769,1035,18.2,45); -- Xin`Xakru
			adds = 1;
			end
	elseif(e.joined == false) then
		adds = 0
		eq.set_timer("shei_despawn", 1800000);
		cleanup()
	end
end

function event_timer(e)
	if (e.timer == "shei_despawn") then
		cleanup()
		eq.depop();
	end
	eq.stop_timer(e.timer)
end

function event_slay(e)
	local a = eq.ChooseRandom(179352,179353,179354,179355);
	-- local x = e.self:GetX();
	-- local y = e.self:GetY();
	-- local z = e.self:GetZ();
	-- local h = e.self:GetHeading();
	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

function event_death_complete(e)
	cleanup()
end

--function cleanup()
--	eq.signal(179352,1,1); -- Xin`Xokra
--	eq.signal(179355,1,1); -- Xin`Xakre
--	eq.signal(179354,1,1); -- Xin`Xakri
--	eq.signal(179353,1,1); -- Xin`Xakru
--end

function cleanup()
	local npc_list = { 179352, 179355, 179354, 179353};
	for _,v in pairs(npc_list) do
		eq.depop_all(v);
	end
end