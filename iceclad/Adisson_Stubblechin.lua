function event_signal(e)
    if (e.signal == 1) then
        e.self:Say("Don't be thinkin' I was forgettin' ya, Nilham, ya spotty-faced salt licker. Remember, ya tell us where ya put our rum, an' we let ya out. Otherwise, ya have ta stay here!");
        local npc2 = eq.get_entity_list():GetMobByNpcTypeID(110218);     -- Avatar of Below
        if (npc2) then
            eq.signal(110218,1,500);
        else
            eq.spawn2(110218, 0, 0, 1318, 4557, 72, 6);
        end
    end
end

function event_say(e)
    if(e.message:findi("runed coldain prayer shaw")) then
        e.self:Say("So it is the sacred rune of the Coldain. Let me have a closer look at it.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8895})) then
		e.self:Emote("Avatar of Below holds the shawl up close to one eye to look at the rune sewn into it. He smiles to himself and then drops it to the ground and places one hand on it. A bright blue glow starts to emanate in the snow, then there is a sudden flash! The Avatar has dissipated. All that is left behind is the Shawl lying in the snow, shimmering with a new power. Pirotess slowly bends down to pick it up, and is infused with a blessing from Brell.");
		e.other:QuestReward(e.self,0,0,0,0,1200,10000);     -- Blessed Coldain Prayer Shawl
		e.signal(110227,5,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end