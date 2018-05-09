--a_dusty_warder (218022)
--Dust Ring Trigger
--poeartha

function event_death_complete(e)	
	local x,y,z = e.self:GetX(), e.self:GetY(), e.self:GetZ()
	eq.local_emote({x,y,z},7,500,"The creature explodes into a maelstrom of dirt and dust.  Suddenly from the whirling cloud of dust three different streams of dirt come form heading to the elemental temple and then the remainder of the maelstrom bursts apart forming into numerous dust devotees.");
	
	--spawn devotees at death site of dusty warder
	for n = 1,math.random(6,8) do
		eq.spawn2(218347,0,0,x + math.random(-20,20),y + math.random(-20,20),z, 0); --#A_Dust_Devotee (218347)
	end
	
	eq.signal(218393,1);	--#dust_controller (218393) to load encounter
end
