function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings traveler. If you are headed through these gates you should be aware that there are many [dangers] you may encounter.");
	elseif(e.message:findi("dangers")) then
		e.self:Say("Recently there have been numerous [brigand] encounters. The [Shak Dratha] have also taken arms against our people.");
	elseif(e.message:findi("shak dratha")) then
		e.self:Say("Very little is known about the Shak Dratha. They appeared shortly after the explosion heard in the thicket. Although they are not really our enemies, they have been known to attack when those unknown to them approach.");
	--Unfinished section
	-- elseif(e.message:findi("who are the shak dratha")) then
	--		e.self:Say("The Khala Dun are the king's warriors. They are charged with defending the city of Shar Vahl and commanding any offensives necessary. They are named after Khala Dun who was King Vah Kerrath's protec");
	elseif(e.message:findi("brigand")) then
			e.self:Say("The brigands arrived shortly after the disappearance [Loda Kai]. Although it shames me to say it. I believe he may in some way be involved with these attacks. I can not bear to think about such an atrocity. Nevertheless there is a bounty on the brigands.");
	elseif(e.message:findi("loda kai")) then
			e.self:Say("Loda Kai was a strong member of the Taruun. he was off to investigate the spirit deaths in shadeweavers thicket when a strong explosion was felt throughout the thickets. He has not been seen since. It was around the time of his disappearance that the brigands began to raid our trade route to shadow haven.");
	elseif(e.message:findi("assigned")) then  --Quest: Beetle Eyes
			e.self:Say("Thank you for coming to assist. We are always looking for hungry new soldiers. Young soldiers get old much too fast these days. Just look at me.' He smiles at this comment. 'Do this old soldier a favor and go down there and gather up a handful of rhino beetle eyes', he says and looks at the mass of crawling creatures that wait below. 'Beetle eyes not only taste good... they keep your fur shiny as well.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 14587, item2 = 14587, item3 = 14587, item4 = 14587})) then --Beetle Eyes (4)
		e.self:Emote("tosses the beetle eyes into his mouth & attempts to say something to the effect of 'here is your payment.' The sound of crunching gristle & popping eyeballs prevents him from saying it properly.");
		e.other:QuestReward(e.self,3,3,0,0,0,1000);
		--Quest: Beetle Eyes (End)
		-- takes repair order from master Barkhem
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29803})) then
		e.self:Say("Outstanding! Nothing like a sharp-looking shield to scare off the undesirables. And if you bring it back full of food I wouldn't complain either,");
		e.self:Emote("laughs, flashing a mischievous grin your way.");
		e.self:Say("Just kidding! You have much to do and Barkhem would have my hide if I kept you from your studies.");
		e.other:QuestReward(e.self,0,0,0,0,29813);
		-- You receive Bokh's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Bokh's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Bokh's Work Order.
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29814})) then
		e.self:Say("Well done, shiny enough to eat off of. My compliments to you " .. e.other:GetName() .. ", Barkhem would be most pleased.");
		e.other:QuestReward(e.self,0,0,0,0,29815);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
