-- Ashley (Dancing Sphinx)
--Plane of Mischief 1.0

--Reference to content:  http://web.archive.org/web/20021117112941/http://www.swtoys.net:80/pom/ashley.html

function event_say(e)
	if (e.message:findi("Hail")) then
		e.self:Say("Well hello! We are great dancers. Would you like to see us dance? Or maybe you would like us to [" .. eq.say_link("teach me to dance",false,"teach you to dance") .. "]?");
	elseif (e.message:findi("teach me to dance")) then
		e.self:Say("Look at you! You can dance! Go go go! Thats the spirit, you got it! Keep up the good work! Dont get too tired now, you are looking a little pale!");
		e.self:SpellFinished(806,e.other);
	elseif (e.message:findi("see you dance")) then
		eq.signal(126207,1);	--Ashley
		eq.signal(126213,1);	--Brittina
		eq.signal(126184,1);	--Roxxanne
		eq.signal(126187,1);	--Diana		
	end
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("Hey! Yeah! Do the Marinara!");
		e.self:DoAnim(33);
	end
end

--standard item return

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end