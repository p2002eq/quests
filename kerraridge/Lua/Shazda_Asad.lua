function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Rrrr..I am  Asad. Shazda of the Kerran [Sejah]. It is my duty to ensure the safety of what lands have not been taken from us by the Erudites. and to train my soldiers in the fighting styles of our heritage.");
	end
	if(e.message:findi("sejah")) then
		e.self:Say("The soldiers of our sejah are all trained from the time they are weaned from their matriarchs. If you wish to be honored by the sejah you must prove to us your loyalty and devotion to the defense of our lands. In Toxxulia Forest there are Erudite emissaries who constantly attempt to encroach upon our territory. Bring me the head of one such emissary.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12319})) then
		e.self:Say("Excellent work, young ayyar! You have proven your willingness to dispose of the enemies of our tribe, now you must face one of their most murderous sentries! Bring me the head of Sentinel Creot and I shall induct you into our sejah!");
		e.other:GiveCash(0,6,0,0);
		e.other:SummonItem(10343);
		e.other:AddEXP(5000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12438})) then
		e.self:Say("You have proven your self yet again! You are now a full member of our sejah because of this brave act! To show your status here is a bracer for you to wear.");
		e.other:SummonItem(	3147);
		e.other:Faction( 175, 30);
		e.other:AddEXP(6500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:kerraridge  ID:74012 -- Shazda_Asad


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
