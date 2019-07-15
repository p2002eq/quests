-- Bremmus Mopfoot quest in Gunthak

-- say block
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend. To see one brave the dangers of this forsaken island is suprising. You must be a treasure seeker. Tell me, do you seek [" .. eq.say_link("I seek treasure", false, "treasure") .. "]?");
    elseif(e.message:findi("treasure")) then
        e.self:Say("Oh that's no good! More competition means less treasure for me. Say, tell you what: If you bring me any trinkets you find, I will reward you depending on their condition.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 362001}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 362002})) then -- Ruined Trinket or Worn Trinket
        e.self:Say("Ah! This is most excellent. I was looking for this piece. Here, take this for your troubles.");
        e.other:QuestReward(e.self, math.random(0,10), math.random(0,10), math.random(0,10), math.random(10,20), 0, eq.ExpHelper(51)); -- ~16pp, 2-4% of lvl 51 exp
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
