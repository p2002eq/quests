function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Mortal! You MUST [" .. eq.say_link("aid me") .. "]! I will have my revenge, and my rest!"));
	elseif(e.message:findi("aid you")) then
		e.self:Say("You must wake [" .. eq.say_link("The Sleeper") .. "]. He is our salvation, he will restore a new golden age to Norrath. It was a terrible mistake to subdue him, jealousy and envy led us to do it. I see all of this clearly now.");
    elseif(e.message:findi("the sleeper")) then
		e.self:Say("Kerafyrm, the best of us, what we should be. We imprsoned him in a timeless slumber aeons ago. I know how to release him, but I am no longer of the flesh, so I cannot do it myself. But you can accomplish this [" .. eq.say_link("task") .. "]!");
    elseif(e.message:findi("task")) then
		e.self:Say("When the tomb was closed and the entry sealed, many dragons participated in the ceremony. They invested portions of their essence into the seal. The seal is part of them now. With the right talismans, I can show you how to make a key that will allow one to pass, as if they were of the First Brood. If you do not wish to do this for the good of all, perhaps you will be willing to do it for material riches. Priceless treasures are stored in the tomb, yours for the taking, once you are inside and have released The Sleeper.");
    end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9296})) then 
		e.self:Say("Very well done. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes, and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
		e.other:QuestReward(e.self,0,0,0,0,27265,500000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27255})) then 
	    e.self:Say("Very well done. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes, and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
		e.other:QuestReward(e.self,0,0,0,0,27265,500000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27256})) then 
		e.self:Say("Very well done. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes, and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
		e.other:QuestReward(e.self,0,0,0,0,27265,500000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27258})) then 
		e.self:Say("Very well done. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes, and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
		e.other:QuestReward(e.self,0,0,0,0,27265,500000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27259})) then
		e.self:Say("Very well done. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes, and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
		e.other:QuestReward(e.self,0,0,0,0,27265,500000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27266})) then 
		e.self:Say("Very well done. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes, and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
		e.other:QuestReward(e.self,0,0,0,0,27265,500000);
	end
	item_lib.return_items(e.self, e.other, e.trade)  
end

function event_spawn(e)
	eq.set_timer("shout",math.random(30,60)*60*1000);		--random shout every 30-60 min
end

function event_timer(e)
	if (e.timer == "shout") then
		local n = math.random(1,5);  	--chooses from 5 known lore dialogues
		if (n == 1) then
			e.self:Shout("Somebody is there, I can tell! Listen to me! We were WRONG, he must be awakened!");
		elseif (n == 2) then
			e.self:Shout("Release him......... release him.........release......ME!");
		elseif (n == 3) then
			e.self:Shout("Zlandicar, I know you are here, you are always here! Do not ignore me, you must listen...we must talk!");
		elseif (n == 4) then
			e.self:Shout("Trakanon, my friend, you BETRAYED me!");
		elseif (n == 5) then
			e.self:Shout("Harla! Phara! It is cold here, and dark....so very dark.");
		end
	end
end