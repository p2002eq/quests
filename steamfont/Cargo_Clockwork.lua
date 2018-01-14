local delivery = 0;

function event_signal(e)
	local qglobal = eq.get_qglobals(e.self);
	if(e.signal == 2) then
		if(qglobal["CargoClockwork"] == nil) then
			eq.depop_all(56178);
			eq.depop_all(56179);
			eq.depop_all(56180);
			eq.set_global("CargoClockwork","1",7,"H2");
			e.self:Say("This unit requires oiling.");
			eq.start(181); --Path to windmills
		end	
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 12) then
		e.self:Say("This unit requires maintenance.");
	elseif(e.wp == 17) then
		if(delivery == 0) then
			delivery = 1;
			e.self:Emote("Chuga.. Chug..Chug..");
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 150, "The chugging of the Cargo Clockwork comes to a halt.");
			eq.spawn2(56178,0,0,30,-700,-109,62); --Hector
			eq.spawn2(56179,0,0,95,-732,-108,240); --Renaldo
			eq.spawn2(56180,0,0,53,-615,-107,113); --Jerald
			e.self:Say("This is highway robbery.");
		end
	elseif(e.wp == 26) then
		eq.get_entity_list():GetSpawnByID(353473):Repop(5);	--Repop Cargo Clockwork at bind
		eq.depop();
	end
end

function event_waypoint_depart(e)
	if(e.wp == 1) then
		e.self:Emote("Chuga... Chug... Chug...");
	elseif(e.wp == 4) then
		e.self:Emote("Chuga... Chug... Chug...");
	elseif(e.wp == 6) then
		e.self:Say("kachunk .. kachunk..");
		eq.signal(56155,1,2*1000); --Watchman_Halv
	elseif(e.wp == 8) then
		e.self:Emote("Chuga... Chug... Chug...");
	elseif(e.wp == 10) then
		e.self:Emote("Chuga... Chug... Chug...");
	elseif(e.wp == 13) then
		e.self:Emote("Chuga... Chug... Chug...");
	elseif(e.wp == 15) then
		e.self:Emote("Chuga... Chug... Chug...");
	elseif(e.wp == 18) then
		e.self:Emote("Chuga... Chug... Chug...");	
	end
end

function event_death_complete(e)
	delivery = 0;
	eq.signal(56178,0); --Hector
	eq.signal(56179,0); --Renaldo
	eq.signal(56180,0); --Jerald
end