function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Welcome to the home of the Keepers of the Art. I am in need of spell components. Would you be willing to [fetch] some for me?");
	elseif(e.message:findi("fetch")) then
		e.self:Say("What I need are some bat wings for a spell I am researching. If you bring me back four bat wings, I would be willing to reward you with a scroll.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13068,item2 = 13068,item3 = 13068,item4 = 13068})) then
		e.self:Say("Ah yes.  These are exactly what I need.  Thank you very much.");
		e.other:SummonItem(eq.ChooseRandom(15310,15332));
		e.other:Ding();
		e.other:Faction(170,5,0);
		e.other:Faction(178,5,0);
		e.other:Faction(99,5,0);
		e.other:Faction(322,-10,0);
		e.other:AddEXP(350);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18777})) then -- Enrollment Letter
		e.self:Say("Welcome. I am Niola Impholder. Master Magician of the Keepers of the Art. Here is our guild tunic. You have much to learn, so let's get started.");
		e.other:SummonItem(13592); -- Faded Training Robe*
		e.other:Ding();
		e.other:Faction(170,100,0); -- Keepers of the Art
		e.other:Faction(178,25,0); -- King Tearis Thex
		e.other:Faction(99,15,0); -- Faydark's Champions
		e.other:Faction(322,-25,0); -- The Dead
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18902})) then
		e.self:Say("She is still alive? OH, thank you for this news.");
		e.other:SummonItem(1307);
		e.other:Ding();
		e.other:AddEXP(30000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwitheb  ID:62021 -- Niola_Impholder