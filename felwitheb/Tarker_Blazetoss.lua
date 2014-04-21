function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met, " .. e.other:GetName() .. "!  Have you come to study. or can you [perform a task] for me this day?");
	elseif(e.message:findi("perform a task")) then
		e.self:Say("That is the spirit.  There are many black wolves wandering Faydark these days.  One of my brethren needs a black wolf skin as a component for his magic.  Bring me a black wolf skin. and I shall reward you for your efforts."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18779})) then -- Enrollment Letter
		e.self:Say("Welcome to the wizards' guild of the Keepers of the Art. My name's Tarker, and I run this guild. You've got a lot of training ahead of you, so let's get started. Here, take this - it's our guild tunic. Wear it with honor, friend.");
		e.other:SummonItem(13594); -- Singed Training Robe*
		e.other:Ding();
		e.other:Faction(170,100,0); -- Keepers of the Art
		e.other:Faction(178,25,0); -- King Tearis Thex
		e.other:Faction(99,15,0); -- Faydark's Champions
		e.other:Faction(322,-25,0); -- The Dead
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13758})) then
		e.self:Say("Ah yes.  This is exactly what I need.  Thank you very much.");
		e.other:SummonItem(eq.ChooseRandom(7007,13009,58094,59964,6012));
		e.other:Ding();
		e.other:Faction(170,10,0); -- Keepers of the Art
		e.other:Faction(178,10,0); -- King Tearis Thex
		e.other:Faction(99,10,0); -- Faydark's Champions
		e.other:Faction(322,-10,0); -- The Dead
		e.other:AddEXP(350);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:felwitheb  ID:62019 -- Tarker_Blazetoss