function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("twitches and growls a little.");
		e.self:Say("Arrr. Grrr. Ahoy, mate. The name's Teep.");
		e.self:Emote("shivers and you notice a little drool at the corner of his mouth.");
		e.self:Say("Ya ain't [" .. eq.say_link("not lost",false,"lost") .. "] out here too, are ya?");
	elseif(e.message:findi("not lost")) then
		e.self:Emote("grins and stares through you with a mad gleam in his eye.");
		e.self:Say("Hehehe. Yah, yer lost aren't ya. I can tell from the crazy sound o' yer voice. Too bad we ain't got me map. The [" .. eq.say_link("map") .. "] would lead us straight back ta camp. Yah, that it would, boyo.");
	elseif(e.message:findi("map")) then
	    e.self:Emote("nods.");
		e.self:Say("After we got ourselves stuck on this island I got it in me head to draw up a map so none o' the crew would ever get lost. So I set myself to explorin' and drawin'. Now the map is [" .. eq.say_link("gone") .. "]. Too bad, too, cause it was a map o' the whole place, not just the first island, but a bunch o' parts.");
	elseif(e.message:findi("gone")) then
	    e.self:Say("Aye. I lost the first part walkin' through the woods. Some big wolf bowled me over 'n started to tear me book up. 'Fore I could stop, it he ran off. I'm not knowin' why. The [" .. eq.say_link("second part") .. "], heh. That was worse.");
	elseif(e.message:findi("second part")) then
		e.self:Emote("shivers.");
		e.self:Say("The second piece I lost. Well, that put the fear o' Bertox in me. I was still in the woods at the time. It was at night. Cold and crisp, it was. I heard a flappin' and squawkin' above me and I knew my time was near. So I up and jumped into a snow drift. Soon as that, somethin' swooped down where I was and started tearin' my camp up. When I came back, I saw nothin' but feathers and me torn up book. Another [" .. eq.say_link("third part",false,"quarter") .. "] o' me book was gone.");
	elseif(e.message:findi("third part")) then
		e.self:Emote("laughs.");
		e.self:Say("Its yer funeral, boyo. I'm not even sure they're readable. Oh, well. Here, take this. It's the cover of the book I was puttin' the map in. If ya get the first four parts, put em in there. If ya get the fifth, just go give it ta Ami the way ya find it. Hey, if ya find em all, come get me so I can find me way back. I'm thinkin' I'd like ta go back now.");
	    e.other:SummonItem(17053);
    --elseif(e.message:findi("hail")) then
		--e.self:Emote("stares at the water.");
		--e.self:Say("I'm rememberin' that. Yah. Ami's book. Thats what I drew, erm, the fifth part o'n. It got lost in the ocean too.' He looks at you. 'Yer wantin' ta go out and find all o' these pieces?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30046})) then
		e.self:Emote("grins widely and slaps you on the arm.");
		e.self:Say("Har har! You're crazier than I am. And since I know that I must not be that crazy after all. Ahh, I haven't felt this good in ages..' He shuffles the pieces and jots down a few notes here and there. 'There, now it's really finished. Let's get us outta here. Hold this fer me.");
		e.other:QuestReward(e.self,0,0,0,0,30047,50000);
		eq.spawn2(110226,0,0,1002,6354,-32.09,130):AddToHateList(e.other,1); --spawn the enraged relative on death
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


--fiddle
