--Dharr's Lure Quests
function event_spawn(e)
	eq.set_timer("1",95000);
end

function event_timer(e)
	if(e.timer == "1") then
		local rand = math.random(8);
		if(rand == 1) then
			e.self:Say("Get your new sturdy fishing pole here, take it on your next adventure!");
		end
		if(rand == 2) then
			e.self:Say("My special fishing bait will attract the best tasting fish, while keeping the Wetfangs away!");
		end
		if(rand == 3) then
			e.self:Say("Come this way, get a great deal on fishing supplies. Everything needed for your next outing!");
		end
		if(rand == 4) then
			e.self:Say("Come check out my wares for all of your fishing needs! Poles, Bait, and Stout, all in one stop!");
		end
		if(rand == 5) then
			e.self:Say("Tired of getting the ones that you have to throw back? Buy my special bait, you will real in the big ones!");
		end
		if(rand == 6) then
			e.self:Say("Hey you look like a mighty fisherman! Come buy a pole from me and catch the big ones!");
		end
		if(rand == 7) then
			e.self:Say("Come up, buy my gear for your next fishing trip!");
		end
		if(rand == 8) then
			e.self:Say("Why not take an extra fishing pole with you on your travels, light and easy to carry.");
		end
	end
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Step up. step up! Please take a moment to purchase some supplies from me. Times are hard and my [luck] has been bad.");
	elseif(e.message:findi("luck")) then
		e.self:Say("I have just come from Hollowshade Moor a few weeks ago. My fishing days have been very unprosperous. The lures that I have now are made of low quality Acrylia and scare the fish away rather than attract them. I want to make a new lure, and on my way in I noticed the dull color of the [scorpions].  I would have moved closer to them but unfortunately I am deathly allergic to the poisons found in scorpion venom.");
	elseif(e.message:findi("scorpions")) then
		e.self:Say("The scorpions are at the bottom of the canyon surrounding the city. If you can bring me four shells to make a few lures, I will give you my old lure. Be careful making your way down the ledges as there are many steep drops.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 3648, item2 = 3648, item3 = 3648, item4 = 3648})) then
		e.self:Say("Excellent, hopefully my fishing business can start to thrive once again! As I said before you can have this old lure. You won't be able to catch anything with it but maybe you can pawn it off to a jewelry merchant.");
		e.other:QuestReward(e.self,0,0,0,0,30694,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
