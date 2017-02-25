---- Quest:Traitor to the Validus Custodus

function event_spawn(e)
	ready = 0
end

function event_say(e)
    if(e.message:findi("hail")) and ready == 0 then
        e.self:Say("ZZZzzzzzzzzzzz")
	elseif e.message:findi("traitor to the Validus Custodus") and ready > 1 then
		eq.unique_spawn(160494, 0, 0, -830, -214, -267, 128):AddToHateList(e.self, 1)
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29845})) then -- Field Orders
        e.self:Say("Huh? What? Oh, umm, let's see here... OK I best get these taken care of right away. Thank you.");
        e.other:Faction(168,1); -- Katta Castellum Citizens
        e.other:Faction(350,2); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
		
		ready = 1
		e.self:SetAppearance(0);
		e.self:AssignWaypoints(30)
		eq.set_timer('prox', 5 * 1000)
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if e.wp == 28 then
		eq.unique_spawn(160487, 0, 0, -822, -296, -267, 128)
		ready = 2
		eq.set_timer('depop', 20 * 60 * 1000)
	end
end

function event_timer(e)
	if e.timer == 'prox' then
		player_check(e.self:CastToNPC())
	elseif e.timer == 'depop' then
		eq.depop_with_timer()
	end
end

function player_check(npc)
	-- checks for players
	local player_list = eq.get_entity_list():GetClientList();
	local br = false;
	if(player_list ~= nil) then
		for player in player_list.entries do
			local dist = player:CalculateDistance(npc:GetX(), npc:GetY(), npc:GetZ())
			if ((dist < 50) or (dist < 150 and not npc:BehindMob(player))) and not player:GetFeigned() then
				npc:PauseWandering(10 * 1000)
				npc:Emote('glances about suspiciously and hesitates.')
				if player:BehindMob(npc, player:GetX(), player:GetY()) then
					npc:Say('Behind true - ' .. player:GetName())
				else
					npc:Say('Behind false - ' .. player:GetName())
				end
				br = true
				break
			end
		end
	end
	
	if not br then
		npc:ResumeWandering()
	end
end
