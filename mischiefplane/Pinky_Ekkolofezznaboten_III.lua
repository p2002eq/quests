--Pinky Ekkolofezznaboten III 
--Plane of Mischief 1.0

--NPC dialogue from http://web.archive.org/web/20021119033024/http://www.swtoys.net:80/pom/pinky.html

function event_say(e)
    if(e.message:findi("hail")) then
		e.self:Say("Knock knock.");
	elseif(e.message:findi("Who's there")) then
		e.self:Say("Will.");
	elseif(e.message:findi("Will who")) then
		e.self:Say("Will you tell ME a knock knock joke?");
	elseif(e.message:findi("knock knock")) then
        e.self:SpellFinished(904, e.other);  --knockback player towards pit trap behind invis wall
		e.self:Say("Here is a knock for ya! Har har har haaaarrr!!!");
    end
end

--standard item return

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

