-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, child. Welcome to Gemchopper Hall. I trust that you are a [warrior], or perhaps you are lost..?");
	elseif(e.message:findi("lost")) then
		e.self:Say("One can easily get lost in Ak'Anon. You must get your vision checked. If you are truly lost, I would advise speaking with a mechanical guide. There should be one close by on the main walkway.");
	elseif(e.message:findi("warrior")) then
		e.self:Say("That is good news! We gnomes are not known for our love of battle so it is always good to bring new blood into our ranks. We shall prove our worth as warriors to all other races. For now. there is much to do in Ak'Anon. There are [rogue clockworks] and the [cargo clockwork].");
	elseif(e.message:findi("rogue clockworks")) then
		e.self:Say("The clockworks are the responsibility of Manik Compolten. Speak with him - I am sure he is here somewhere.");
	elseif(e.message:findi("cargo clockwork")) then
		e.self:Say("The cargo clockwork is located near the entrance to Ak'Anon in the Steamfont Mountains. It runs a delivery to the windmills every five days at eight in the morning. There have been attacks by a group of highwaymen. They are quite a formidable group. I have offered a reward for their heads. Be very careful if you plan on escorting the cargo clockwork. This trio of bandits is very strong.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
