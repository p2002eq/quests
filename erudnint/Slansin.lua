-- Inert Potion

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome! Please feel free to look around");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13983})) then
		if(e.self:GetClass() == 41) then
			e.self:Say("Thank you. I have been expecting this. We require it for mixing.");
			e.other:Ding();
			e.other:Faction(56,-15,0);
			e.other:Faction(145,-15,0);
			e.other:Faction(143,10,0);
			e.other:Faction(147,-15,0);
			e.other:AddEXP(300);
			eq.depop();
		elseif(e.self:GetClass() == 14) then
			e.self:Say("Ha!! What a fool!! I have stolen another potion to add to the crate. I shall make a fortune!! The real Slansin is in back. Now it is time for me to leave.");
			quest::faction(48,10); -- +Coalition of Tradefolk Underground
			quest::faction(47,10); -- +Coalition of Tradefolk
			quest::faction(31,10); -- +Carson McCabe
			quest::faction(53,10); -- +Corrupt Qeynos Guards
			quest::faction(105,5); -- +Freeport Militia
			e.other:AddEXP(300);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:23001 -- Slansin