--player.lua
--Plane of Tranquility

function event_click_door(e)
	local door = e.door:GetDoorID();
	local group = e.self:GetGroup();
	local raid = e.self:GetRaid();
	local qglobals = eq.get_qglobals(e.self);
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs

	--valor/storms
	if(door == 16 or door == 21) then
		if(qglobals.pop_poj_valor_storms ~= nil) then
			if(e.self:HasZoneFlag(210) ~= 1 or e.self:HasZoneFlag(208) ~= 1) then
				e.self:SetZoneFlag(210);
				e.self:SetZoneFlag(208);
			end
		end
	end

	--codecay (VERIFIED)
	if(door == 12) then
		if((qglobals.pop_pod_alder_fuirstel ~= nil  and qglobals.pop_pod_grimmus_planar_projection ~= nil) or qglobals.pop_alt_access_codecay) then
			if(e.self:HasZoneFlag(200) ~= 1) then
				e.self:SetZoneFlag(200);
			end
		
		end
	end

	--torment (VERIFIED)
	if(door == 93) then
		if(qglobals.pop_cod_final ~= nil and qglobals.pop_ponb_poxbourne ~= nil) then
			if(e.self:HasZoneFlag(207) ~= 1) then
				e.self:SetZoneFlag(207);
			end
		end
	end

	--bothunder
	if(door == 48) then
		if(qglobals.pop_poj_valor_storms ~= nil  and (qglobals.pop_pos_askr_the_lost ~= nil and tonumber(qglobals.pop_pos_askr_the_lost)  == 3) and qglobals.pop_pos_askr_the_lost_final ~= nil) then
			if(e.self:HasZoneFlag(209) ~= 1) then
				e.self:SetZoneFlag(209);
			end
		end
	end

	--hohonora
	if(door == 23) then
		if((qglobals.pop_poj_valor_storms ~= nil and qglobals.pop_pov_aerin_dar ~= nil ) or qglobals.pop_alt_access_hohonora ~= nil) then
			if(e.self:HasZoneFlag(211) ~= 1) then
				e.self:SetZoneFlag(211);
			end
		end
	end

	--potactics
	if(door == 24) then
		if((qglobals.pop_poi_behometh_preflag ~= nil  and qglobals.pop_poi_behometh_flag ~= nil ) or qglobals.pop_alt_access_potactics ~= nil ) then
			if(e.self:HasZoneFlag(214) ~= 1) then
				e.self:SetZoneFlag(214);
			end
		end
	end
	
	--solrotower
	if(door == 22) then
		if(qglobals.pop_poi_behometh_preflag ~= nil  and qglobals.pop_poi_behometh_flag ~= nil  and qglobals.pop_tactics_tallon ~= nil  and qglobals.pop_tactics_vallon ~= nil  and qglobals.pop_pot_saryrn_final ~= nil  and qglobals.pop_hohb_marr ~= nil) then
			if(e.self:HasZoneFlag(212) ~= 1) then
				e.self:SetZoneFlag(212);
			end
		end
	end

	--pofire
	if(door == 82) then
		if(qglobals.pop_elemental_grand_librarian ~= nil  and qglobals.pop_sol_ro_arlyxir ~= nil and qglobals.pop_sol_ro_jiva ~= nil and qglobals.pop_sol_ro_rizlona ~= nil and  qglobals.pop_sol_ro_dresolik ~= nil and qglobals.pop_sol_ro_xuzl ~= nil  and qglobals.pop_sol_ro_solusk ~= nil) then
			if(e.self:HasZoneFlag(217) ~= 1) then
				e.self:SetZoneFlag(217);
			end
		end
	end

	--powater/poearth/poair
	if(door == 81 or door == 83 or door == 84) then
		if(qglobals.pop_elemental_grand_librarian ~= nil) then
			if(e.self:HasZoneFlag(216) ~= 1 or e.self:HasZoneFlag(215) ~= 1 or e.self:HasZoneFlag(218) ~= 1) then
				e.self:SetZoneFlag(216);
				e.self:SetZoneFlag(215);
				e.self:SetZoneFlag(218);
			end
		end
	end
end

-----------------------------------
--POP ALPHA TESTING MODULE
function event_say(e)
	local pop_flags = require("pop_flags");
	pop_flags.options(e)
end

-----------------------------------

