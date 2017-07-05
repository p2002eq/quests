--Mister Malodor 
--Plane of Mischief 1.0

--LUA Trigger event to make character smelly upon hailing NPC (http://web.archive.org/web/20021119032730/http://www.swtoys.net:80/pom/mistermalodor.html)

function event_say(e)
    if(e.message:findi("Hail")) then
		e.self:Say("QUIET!!! People are trying to study around here! Keep your yap shut!");
		e.self:SpellFinished(906, e.other);  --cast SkunkSpray (cha debuff)
    end
end

--standard item return

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end