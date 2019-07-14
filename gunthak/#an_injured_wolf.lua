-- An injured wolf in Gunthak

-- depop timer... this is a quest mob with 10x the hitpoints of other trash, don't it to take up spawnpoints in the area for long
function event_spawn(e)
    eq.set_timer('depop', 10 * 60 * 1000);
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.stop_timer('depop');

        eq.depop_with_timer();
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359032})) then -- Stone Emblem
        e.self:Emote("cringes as you lean forward, but visibly relaxes as it recognizes the stone in your hand. You place the stone emblem into the clasp on the collar. The collar begins to glow softly and the beast begins to look much healthier. he struggles to his feet and looks at you for a moment. He then lets out a great howl that echoes in the caverns. He moves towards you and nuzzles your hand. You reach forward and run you fingers across his head. As your fingers cross the collar, the wolf winks out of existence, leaving you holding only only the softly glowing collar.");
        e.other:SummonItem(359033); -- Glowing Collar
        eq.depop_with_timer();
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
