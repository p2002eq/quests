function event_spawn(e)
    e.self:Emote(" voice echoes through the area. 'The efforts to help the Coldain and bring them together with the gnomes of Iceclad is quite impressive. There will be no doubt that they will continue to increase in power until they can overtake the Giants of Zek. Hey there, what is that on your shoulder?'");
    eq.set_timer("avatarshawl",600000); -- 10 minutes to do turn in
end

function event_say(e)
    if(e.message:findi("runed coldain prayer shawl")) then
        e.self:Say("So it is the sacred rune of Coldain. Let me have a closer look at it.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8895})) then
	    e.self:Emote("holds the shawl up close to one eye to look at the rune sewn into it. He smiles to himself and then drops it to the ground and places one hand on it. A bright blue glow starts to emanate in the snow, then there is a sudden flash! The Avatar has dissipated. All that is left behind is the Shawl lying in the snow, shimmering with a new power. " ..e.other:GetName().. " slowly bends down to pick it up, and is infused with a blessing from Brell.");
	    e.other:QuestReward(e.self,0,0,0,0,1200,10000);     -- Blessed Coldain Prayer Shawl
	   e.self:Say("turned in");
	    eq.signal(110227, 5, 4000);
	    e.self:Say("signal sent");
	    eq.eq.stop_timer("avatarshawl");
	    e.self:Say("timer stopped");
	    eq.depop();
	    e.self:Say("should have depopped");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
    if (e.timer == "avatarshawl") then
        eq.eq.stop_timer("avatarshawl");
        eq.depop();
    end
end