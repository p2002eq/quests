-- white paper portion of enchanter epic quest lead-in

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("slowly lifts her head.'Have you brought any [" .. eq.say_link("writing materials") .. "] for me? The last few supplies I had were stolen.'");
	elseif(e.message:findi("writing materials")) then
		e.self:Say("A passing illusionist gave me some enchanted writing materials. He said they would help inspire me to capture my mind's images on paper. If you would just be so kind as to bring me plain old [" .. eq.say_link("paper") .. "] and a quill from Qeynos, I can get back to writing.");
	elseif(e.message:findi("paper")) then
		e.self:Say("I don't know who might be selling those these days. Just ask around. I am sure someone will know.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13063,item2 = 13051})) then
		e.self:Emote("gives you a hug. 'Thank you so much. I did some cleaning after you left and found this behind a barrel. It may have been left behind by the person who took my materials. You can have it.'");
		e.other:SummonItem(12100);
		e.other:Ding();
		eq.depop_all(12001);
		eq.spawn2(12001,0,0,-11570,878,14,270.0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
