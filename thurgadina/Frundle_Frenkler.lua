function event_say(e)
	if(e.message:findi("velium vapors")) then	
		e.self:Say("Ahh, you come seeking my family recipe? After all you've done for our people it's the least I can do. First you must fashion a velium vial, then combine the vial with two small pieces of velium in this jar. That's all there is to it. Please keep the recipe a secret.");
	elseif(e.message:findi("velium vial")) then			
		e.self:Say("I'm no potter mind you, but if I remember correctly it's a small brick of velium, three crystalline silks, and two glass shards. Then you'll have to finish up by firing it in a kiln with a high quality firing sheet.");
		e.other:SummonItem(17513);
	end

end
