-- shardwurm broodmother Kromriff Military Leggings and Coldain Military Wristguard quests
-- gloabl flag for which quest chain to follow
local quest_chain = "None"
-- tracks first arrival at waypoint1 to prevent repeat triggering
local arrived_first = false
-- tracks first arrival at waypoint2 to prevent repeat triggering
local arrived_second = false

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30272})) then -- Harness of Control
		quest_chain = "Kromriff"
		e.self:Emote("reels in pain as the harness snaps around its neck tightly. A strange gleam enters its eyes as it slowly begins to shamble towards the exit and the giants fortress.");
		e.other:Ding();
		e.other:AddEXP(20000);
		-- start gridid 135 (Kromriff fort path)
		eq.start(135);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30274})) then -- Giants Harness of Control)
		quest_chain = "Coldain"
		e.self:Emote("reels in pain as the harness snaps around its neck tightly. A strange gleam enters its eyes as it slowly begins to shamble towards the exit and the coldain mining camp.");
		e.other:Ding();
		e.other:AddEXP(20000);
		-- start gridid 136 (Coldain cave path)
		eq.start(136);
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	-- Giant fort chain - grid 135 pathing 
	if(e.wp == 9 and quest_chain == "Kromriff" and not arrived_first) then
		-- broodmother signals giants to walk out as she exits cave
		arrived_first = true
		eq.signal(118090,1);
		eq.signal(118091,1);
	elseif(e.wp == 12 and quest_chain == "Kromriff" and not arrived_second) then
		arrived_second = true
		-- as she approaches the fort, she attacks Gralk and signals Fergul respawn as running version
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118091)) then
			eq.attack_npc_type(118091);
			eq.signal(118090,2);
		end
	elseif(e.wp == 9 and quest_chain == "Coldain" and not arrived_first) then
		-- broodmother signals dwarves to walk out as she exits cave
		arrived_first = true
		eq.signal(118065,1);
		eq.signal(118066,1);
	elseif(e.wp == 13 and quest_chain == "Coldain" and not arrived_second) then
		arrived_second = true
		-- as she approaches the cave, she attacks Relik and signals Korf to respawn as running version
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118065)) then
			eq.attack_npc_type(118065);
			eq.signal(118066,2);
		end
	end
end

function event_signal(e)
	-- signal to depop from Fergul/Korf once he either reaches the end of his path or dies (uses signal 2 for consistency)
	if(e.signal == 2) then
		eq.depop_with_timer();
	end
end

-- for Coldain Military Wristguard. use grid 136 - WP #14 for encounter location (outside cave). spawn dwarves nearby!