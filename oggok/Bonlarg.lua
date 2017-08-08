function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Shadowknight master me be!!  " .. e.other:GetName() .. " prove to me that " .. e.other:GetName() .. " be worthy to be one with Greenblood and me give " .. e.other:GetName() .. " black shadow tunic.  You [" .. eq.say_link("want black shadow tunic") .. "]?");
	elseif(e.message:findi("black shadow tunic")) then
		e.self:Say("Help Greenbloods you will. Give lizard tails to Grevak.  Den maybe we trust.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end