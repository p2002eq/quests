function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Avast you! Ya best be shoving off if ye knows whats good for you. We be pirate raiders and ya not be messing with the likes of us!");
        local npc = eq.get_entity_list():GetMobByNpcTypeID(110052);
        if (npc) then
            eq.signal(110052,1,500);
        else
            eq.spawn2(110052, 0, 0, 2209, 4716, -33, 109);
            eq.signal(110052,1,500);
        end
        e.self:Say("The cap'n said PIRATES! Not parrots ye knucklehead!");
        e.self:Emote("He whacks the other raider upside the head");
        e.self:Say("now whars the tinkered rope!?");
        eq.signal(110052,2,500);
    elseif(e.message:findi("What tinkered rope?")) then
        e.self:Say("Batten down yer yapper! Ahl be doin the talking here. We be needin the rope to tie ye down fer ransom. Now fetch me the beard of a frost giant scout so's I can make some more rope to tie ye up with.");
    end
end

function event_signal(e)
    if (e.signal == 101) then
        e.self:Say("Arrrrrrrrrrr!");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30048})) then
		e.self:Say("Arg! By blubberbeards nostril! Ye'v done it!'");
        e.self:Emote("He braids the beard together into a sturdy rope.");
        e.self:Say("Now take this here rope and tie yerself up! Come lets go tell the cap'n we've captured us some prisoners!");
        e.other:QuestReward(e.self,0,0,0,0,30049,1000);
        e.other:Faction(251,30);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end