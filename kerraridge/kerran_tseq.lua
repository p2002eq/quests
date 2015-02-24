function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Errr. You smell funny. You bring us [toy]?");
	elseif(e.message:findi("toy")) then
		e.self:Say("You go, bring us gnome toy. You not come back or we eat you and then you die like short one. Gnome toy! You bring. You good person.");
	end
end
	
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 6344})) then
		e.self:Say("Rreeee! Great toy. Shiny. We not need this old toy anymore. You take. Now go way, this our toy, we play.");
		e.other:Faction(175, 10);
		e.other:QuestReward(e.self,0,0,0,0,13748);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
