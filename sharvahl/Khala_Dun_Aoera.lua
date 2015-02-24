--Quest for Whiptail Poison Gland
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our fair city traveler. We have much in the way of fine food and entertainment. If you are planning to explore the crater, please beware of the [vermin] infesting the area.");
	elseif(e.message:findi("vermin")) then
		e.self:Say("There are all kinds of bugs, worms, and even grimlings that roam through the crater. They scavenge the food dropped below by careless people, as well as the occasional unskilled citizens and adventurers who wish to put their hunting prowess to the test. If you are considering hunting in the crater despite my warnings, do consider assisting our city by returning with some of the scorpion glands. If you supply Spiritist Ragnar with these glands, he will be able to make a sufficient anti venom for those who are bit by these horrid little beasts.");
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
