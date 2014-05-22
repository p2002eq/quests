-- Quest file for Najena - Linara Parlone: Mystic Cloak

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please [help] me out of this horrid place! My family must be terribly worried!");
	elseif(e.message:findi("help")) then
		e.self:Say("If you can find the [key] to my restraints. I should be able to escape.");
	elseif(e.message:findi("key")) then
		e.self:Say("Last I knew, Najena's priest had the key. I fear he has left this place though. I heard talk of traveling to some estate. I know not where. Oh dear, oh dear! I shall never leave this place!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12269})) then -- tarnished bronze key
		e.self:Say("Oh my! Thank you so very much! here, take this note to my father. I am sure he will reward you well for my safety.");
		quest::summonitem(5573);
		e.other:Ding();
		e.other:Faction(170,10);
		e.other:Faction(178,2);
		e.other:Faction(99,1);
		e.other:Faction(322,-2);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end