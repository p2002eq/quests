----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: tormented wraith (201055)
----------------------------------------------------------------------

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	local x,y,z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	local spawns = {	[345591] = {201518},	--#exiled_trooper_of_Marr (201518)
						[345579] = {201519},	--#exiled_soldier_of_Marr (201519)
						[345592] = {201520} };	--#exiled_officer_of_Marr (201520)
	local spawn_id = e.self:CastToNPC():GetSpawnPointID();
	
	if spawns[spawn_id] ~= nil then
		if math.random(100) <= 40 then --40% chance to spawn a shade on death
			eq.local_emote({x,y,z},7,150,"As the shade receives a killing blow, its weakened form falls to the ground, idle and still.");
			eq.spawn2(spawns[spawn_id][1],0,0,x,y,z,0);	--will spawn shade which collapses to North to not stack on wraith's corpse (verified on live)
		else
			eq.local_emote({x,y,z},7,150,"As the shade receives a killing blow, its image wavers for a moment, weakened, then fades away, unable to maintain its form.");
		end
	end
end