--On aggro, will spawns 4 adds every 2 minutes,  Adds will aggro the tank
--After 30 minutes the event will depop along with all the frogs it adds.

local mob1;
local mob2;
local mob3;
local mob4;
local frogid = 210246;

function event_combat(e)
	if e.joined then
		eq.set_timer("depop",30 * 60 * 1000); --30 minutes to depop
		eq.set_timer("adds",2 * 60 * 1000); --2 minutes to spawns
	else
		eq.stop_timer("adds");
		eq.depop_all(frogid);
	end
end

function event_timer(e)
	if timer == "depop" then
		eq.depop_all(frogid);
		eq.depop();
	elseif e.timer == "adds" then
		SpawnAdds(e);
	end
end


function SpawnAdds(e)
	-- Z+5 hills in the area - Don't want frogs stuck underground
	mob1 = eq.spawn2(frogid,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ()+5,e.self:GetHeading());
	mob2 = eq.spawn2(frogid,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ()+5,e.self:GetHeading());
	mob3 = eq.spawn2(frogid,0,0,e.self:GetX()-5,e.self:GetY()+5,e.self:GetZ()+5,e.self:GetHeading());
	mob4 = eq.spawn2(frogid,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ()+5,e.self:GetHeading());
	mob1:AddToHateList(e.self:GetHateTop(),1);
	mob2:AddToHateList(e.self:GetHateTop(),1);
	mob3:AddToHateList(e.self:GetHateTop(),1);
	mob4:AddToHateList(e.self:GetHateTop(),1);
end


function event_death_complete(e)
	eq.depop_all(frogid);
end

--Used snippet from ferubi/Packmaster_Skoiat_Pizak.pl   Didn't see a name but giving credit where it is due
--Event by Chance -  If you break it, you fix it!