function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["AidEinoDone"] ~= nil and (qglobals["AidEinoDone"] == 1)) then
		if(e.message:findi("hail")) then
			e.self:Say("Why hello " .. e.other:GetName() .. "! It is good to see you again after our adventure in the Plane of Nightmare. Know that you have shown your worth to both Kerasha and myself. Should you ever need anything feel free to call upon us. May Quellious guide your path in the Planes!");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Greetings " .. e.other:GetName() .. "! I am Eino, Monk of Quellious and Aid to Councilwoman Kerasha! I spend my time as protector to the councilwoman as well as taking small jaunts to the planes to obtain items for her magic research. If you be a hearty individual with some allies you may be able to help me.");
		end
		if(e.message:findi("help")) then
			e.self:Say("Then meet me this night in the Plane of Nightmares. Near the waterfall of the upper plateau is a large tree. Should you see a soft glow, know that I am about. Signal to me by saying 'Quellious be my guide'. I shall emerge from my concealment.");
			eq.set_global("EinoTrigger","1",5,"H6");
		end
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
