function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greeting. Do not you find the wine of Kelethin as sweet as their women?");
	elseif(e.message:findi("lens")) then
		e.self:Say("Oh my!! I forgot I had that. Here you are. You better take it back I need to go elsewhere, bye now.");
      e.other:SummonItem(13276); -- telescope lens [" .. eq.say_link("bidl's lens") .. "]
	end
end