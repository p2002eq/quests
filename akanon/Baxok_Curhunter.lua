function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18770)) then -- Recruitment Summons
		e.other:Message(15,"Baxok Curhunter, a jittery older looking gnome appears to be startled. 'Well hello there. You scared me! You young ones always popping up here and there. You would think there is a hidden tunnel somewhere around here the way you just popped up near me. Well no matter. If you are here to train with the warriors of Gemchopper Hall, read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. ". I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [" .. eq.say_link("new recruit") .. "] or [" .. eq.say_link("an outsider") .. "], perhaps?");
	elseif(e.message:findi("new recruit")) then
		e.self:Say("Well, good to make your acquaintance, " .. e.other:GetName() .. ". Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [" .. eq.say_link("serve the Crown") .. "] or has a yellow streak appeared upon your back?");
	elseif(e.message:findi("an outsider")) then
		e.self:Say("I should have guessed as much. You look the part.");
	elseif(e.message:findi("serve the crown")) then
		if(e.other:GetLevel() <=5 ) then
			e.self:Say("You are too inexperienced. Leave that business to someone more worldly.");
		else
			e.self:Say("Go quickly then " .. e.other:GetName() .. ", hunt down a stolen clockwork named Gearheart who has been taken by the Faeries in Lesser Faydark and return to me his blackbox.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18770})) then -- Recruitment Summons
		e.self:Say("I, Baxok, guildmaster, welcome you to Gemchopper Hall, young warrior! You are expected to serve his majesty, King Ak'Anon, with pride. You have much to learn. You may report to any of the trainers for further guidance. Go forth and serve!");
		e.other:Faction(115,100,0); -- Gem Cutters
		e.other:Faction(210,25,0); -- Merchants of Ak'anon
		e.other:Faction(176,25,0); -- King Akanon
		e.other:Faction(71,-25,0); -- Dark Reflection
		e.other:Faction(39,-5,0); -- Clan Grikbar
		e.other:QuestReward(e.self,0,0,0,0,13520,100); -- Torn and Ripped Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13344})) then
		e.other:Faction(115,10,0); -- Gem Cutters
		e.other:Faction(210,10,0); -- Merchants of Ak'anon
		e.other:Faction(176,10,0); -- King Akanon
		e.other:Faction(71,-10,0); -- Dark Reflection
		e.other:Faction(39,-10,0); -- Clan Grikbar
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9002,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1010,1011),0); -- cloth armor or round shield
	end
	item_lib.return_items(e.self, e.other, e.trade)
end