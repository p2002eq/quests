--#a_maniacal_dark_knight
--Plane of Mischief 1.0

--NPC Dialogue from https://www.project1999.com/forums/archive/index.php/t-158491.html
  
function event_say(e)
	if (e.message:findi("Hail")) then  
		e.self:Emote("Greetings, friend. Perhaps an intelligent ".. e.other:Race() .. " such as you can assist me in a friendly game of find the exit. I really like being with friends rather than being alo... No! NONONO! Make the fluffy goodness stop! You must help me! Squire!!! Squire! Curse him where is he when I need him. Find my squire you pathetic fool!")
		eq.depop_with_timer();
	end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24553})) then --Check for Black Squire
		local reward = math.random(1,10);
		e.self:Say("You have found it!! Thank Innoruuk! I am sorry that you had to witness my moment of weakness. These tunnels twist and bend my very thoughts. Perhaps this trinket will assist you in your journey. I pray to the lord of hate that you find this madman and put an end to this insanity.");
		e.other:SummonItem(10028,reward);  --random amount of peridots rewarded
		e.other:AddEXP(100);
		eq.depop_with_timer();
    end 
	item_lib.return_items(e.self, e.other, e.trade);
end