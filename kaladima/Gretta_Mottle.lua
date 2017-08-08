function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ".  I'm Gretta Mottle.  Tumpy has been kind enough to let me to set up my bakery in his fine establishment here.  Unfortunately, with that nasty plague corruptin' the crops in the Plains of Karana, things are goin' a bit slow for me.  I keep runnin' out of bread and muffins to sell.  Because of flour bein' easily spoiled now, it takes longer to make 'em just right.  My assistant Buggle is still learnin' how to cook.  Hehe.. All he can make is Meat Pie.  If I don't get any [" .. eq.say_link("help to bake") .. "] soon I won't be able to keep the supply up with the demand.");
	elseif(e.message:findi("help to bake")) then
		e.self:Say("Glad to hear it.  Are ye thinkin' of helpin' me to [" .. eq.say_link("bake muffins") .. "] or did ye want to [fetch some bread] for me?");
	elseif(e.message:findi("bake muffins")) then
		e.self:Say("Ah. if ye want to help me with the bakin");
	elseif(e.message:findi("what fetch some bread")) then
		e.self:Say("The only one who can make bread almost as good as I can is Jarlen Meadowgreen.  He lives a long way off though.. in the southern Plains of Karana.  If ye travel there, tell him that you are there to pick up some bread loaves for me.");
	end
end
