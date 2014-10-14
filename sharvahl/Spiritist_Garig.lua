local count = 0;
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met, " .. e.other:GetName() .. ". If you need any assistance, please ask one of my apprentices. They are here to help.");
	end
end

function event_spawn(e)
	eq.set_timer("spirit",8000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("The energy that is gathered here is quite soothing. As you both progress in your studies, you will learn to sense it as well.");
	end
	if(count == 2) then
		eq.signal(155215,1,1);
	end
	if(count == 3) then
		e.self:Say("Nay, though I cannot say for sure, I have a feeling that this energy is of an entirely different nature.");
	end
	if(count == 4) then
		eq.signal(155215,2,1);
	end
	if(count == 5) then
		e.self:Say("The energy's nature is obscured from me at this time, but I have a few theories. We are experiencing another period of change. Our contact with the Old World can only mean that the spirits are wishing us to move forward, once again.");
	end
	if(count == 6) then
		eq.signal(155214,1);
	end
	if(count == 7) then
		e.self:Say("Perhaps, Omosh, perhaps... Khati Sha explored a large portion of this place, but did he not disappear? Have the spirits not grown mute? Is our purpose here merely to wage war on the savage little creatures of the forest or is there a greater threat? There are still plenty of questsons before us, students. Please take some time to think them over.");
		eq.set_timer("spirit",450000);
	end
	if(count == 8) then
		count = 0;
		eq.set_timer("spirit",8000);
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
