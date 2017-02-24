---- Quest:Traitor to the Validus Custodus

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("ZZZzzzzzzzzzzz");
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
		
		e.self:SetAppearance(1);
		eq.start(30);
		eq.set_timer('prox', 10 * 1000)
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer == 'prox' then
		player_check(e.self:CastToNPC())
	end
end

function player_check(npc)
	-- checks for players
	local player_list = eq.get_entity_list():GetClientList();
	local br = false;
	if(player_list ~= nil) then
		for player in player_list.entries do
			if player:CalculateDistance(npc:GetX(), npc:GetY(), npc:GetZ()) <= 50 and not player:GetFeigned() then
				npc:StopWandering()
				br = true
				break
			end
		end
	end
	
	if not br then
		npc:ResumeWandering()
	end
end
