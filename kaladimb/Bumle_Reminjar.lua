function event_say(e)
    local faith = "The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.";
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, " .. e.other:GetName() .. ". The Cathedral of Underfoot welcomes all good persons. May you find peace from the dangers of Butcherblock within these walls. The paladins of this holy place are very much aware of the evils outside Kaladim. The threat of goblins and [birdmen] has increased.");
	elseif(e.message:findi("birdmen")) then
		e.self:Say("The birdmen I speak of are the aviak krags. These vile creatures have desecrated our land. They have dared to perch upon our great statue. The king has instructed all noble paladins in this order to [destroy the krag chicks].");
	elseif(e.message:findi("chicks")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Yes. You are known to have aided our cause. You shall continue by returning any aviak chick talons to me. I will reward you for the return of no fewer than four at a time. Go, and serve the will of the king!");
		else
			e.self:Say(faith);
		end
	elseif(e.message:findi("elders")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("The krag elders are the strongest of the aviaks. Their might has been well-documented by our order. Our high ranking paladins are ordered to slay the eagles. If you are with us, return four aviak talons to me and a fine reward shall be yours. Perhaps even our cathedral tailors and scribes may donate to your quest.");
		else
			e.self:Say(faith);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 12157, item2 = 12157, item3 = 12157, item4 = 12157}))) then
		e.self:Say("You have done well. Your deeds shall be recorded within our journals. Here, then, is your reward. May you strive to serve us to the full extent of your powers. The [elders] must also die.");
		e.other:SummonItem(eq.ChooseRandom(2116,2118,2120,2123,2124));
		e.other:Faction(44, 20);  --Clerics Of Underfoot
		e.other:Faction(169, 20); --Kazon Stormhammer
		e.other:Faction(219, 20); --Miner's Guild 249
		e.other:AddEXP(5000);
		e.other:Ding();
	elseif((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.trade, {item1 = 12158, item2 = 12158, item3 = 12158, item4 = 12158}))) then
		e.self:Say("Ahh! you are truly brave, " .. e.other:GetName() .. "!");
		e.other:Faction(44, 40);  --Clerics Of Underfoot
		e.other:Faction(169, 40); --Kazon Stormhammer
		e.other:Faction(219, 40); --Miner's Guild 249
		e.other:AddEXP(80000);
		e.other:GiveCash(0,4,5,2);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
