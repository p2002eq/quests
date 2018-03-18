local instance_id;
local killed = false;

function event_encounter_load(e)
	eq.register_npc_event("anniversary_event", Event.death, -1, allDeath);
	eq.register_npc_event("anniversary_event", Event.death_complete, -1, finalDeath);
end

function finalDeath(e)
	killed = false;
end


function allDeath(e)
	if (killed == false) then
		killed = true;
		if (math.random(1,100) > 75) then
			e.self:Say("Nooo, not my bread!");
			local hateList = e.self:CastToNPC():GetHateList();
			for mob in hateList.entries do
				if (mob.ent:IsClient() == true) then
					local qglobals = eq.get_qglobals(e.self);
					local global = mob.ent:CastToClient():GetForumName(mob.ent:CastToClient():AccountID()) .. "-Cocain";
					local numBread = qglobals[global];				
					if (numBread ~= nil) then
						if (tonumber(numBread) > 20) then
							mob.ent:CastToClient():Message(15,"You have already gathered enough bread for Cocain!");
						elseif (numBread == "20") then
							mob.ent:CastToClient():Message(15,"You have already gathered 20 pieces of bread, head back to talk to Cocain.");
						elseif (numBread == "19") then
							mob.ent:CastToClient():Message(15,"You have now gathered 20 pieces of bread!  Time to return to Cocain with your haul.");
							eq.set_global(global,"20",7,"F");
						else
							mob.ent:CastToClient():Message(15,"You have gathered another piece of bread!");
							eq.set_global(global ,tostring(tonumber(numBread) + 1),7,"F");					
						end
					end		
				end
			end
		end
	end	
end