function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ". I am Mignah. a humble acrylia specialist. If you have a form of acrylia that merchants will not buy please hand it to me and I will pay you whatever it may be worth.");
	elseif(e.message:findi("acrylia slate")) then
		e.self:Emote("pulls a smoldering piece of forged acrylia from a nearby oven and, before you can react, presses your hand into the still soft metal.");
		e.self:Say("This may hurt a bit, but it'll heal.");
		e.self:Emote("etches your name and the date into the slate and plunges it into a bucket of water before placing it into your stinging palm. ");
		e.other:QuestReward(e.self,0,0,0,0,2876); -- Acrylia Slate
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
