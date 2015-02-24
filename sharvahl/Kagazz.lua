function event_say(e)
	if(e.message:findi("fasteners")) then
		e.self:Say("Ah, Poren must have sent you. May I inspect your slate first?"); --Still need real text
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2877})) then --Acrylia Slate of Shar Vahl
		e.self:Say("My wife is making some jewelry. Not the sparkly stuff, mind you. She is nearly blind so appearance means little to her. She is intent on making jewelry with a more, uhh, natural feel. Currently she's constructing a special scorpion leg necklace, and is in need of more scorpion legs. I can't leave the shop so I need your help. Fill this box with scorpion legs and I'll pay you with metal fasteners that any merchant will gladly buy.");
		e.other:SummonItem(2877); --Acrylia Slate of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,17238); --Kagazz's Box
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3676})) then --Box of Scorpion Legs
		e.self:Say("Excellent! My wife will be happy to continue working on her necklace. Take these fasteners as payment for your assistance."); --Still need real text
		e.other:QuestReward(e.self,0,0,0,0,3667); --Forged Fasteners
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
