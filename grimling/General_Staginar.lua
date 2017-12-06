--General Staginar (167193)
--


local started = false;
local veteran = 167196;	--Veteran Cullin

function event_spawn(e)
	started = false;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if e.message:findi("hail") then
		e.self:Say("Greetings " .. e.other:GetName() .. ". Are you here to [" .. eq.say_link("serve") .. "] in the war against the grimling horde.");
	elseif e.message:findi("serve") then
		e.self:Say("As you probably know, we've been battling the grunts for nearly a generation now. They have proven to be a challenging opponent. We've inflicted great casualties upon their kind in this war, yet somehow, they seem to grow even more numerous. Barring some miracle, they will become a serious threat to Shar Vahl very soon. One remaining strategy has a chance of bringing us victory, but none have met the [" .. eq.say_link("requirements") .. "] for its implementation.");
	elseif e.message:findi("requirements") then
		e.self:Say("Our intelligence has provided us with some information about the enemy. They blindly follow a being they refer to as 'the master'. Our high spiritists have sensed a powerful presence from the caverns beyond our mines, but only those who possess a [" .. eq.say_link("special key") .. "] can venture there. None who have obtained the key and ventured into the caverns have been seen alive again.")
	elseif e.message:findi("special key") then	
		e.self:Say("The [" .. eq.say_link("grimling high commander") .. "] holds half of a magical acrylia obelisk that will transport the wielder to their master's stronghold. I have slain the high commander who held the other half of the obelisk and I have the knowledge of it's construction. I will only give it to one who has proven to be a powerful soldier, for nothing less would stand a chance against the enemy ruler.");
	elseif e.message:findi("grimling high commander") then	
		e.self:Say("The grimling high commander will only appear if their compound to the north is overrun. There are two encampments near the compound that will need to be invaded as well in order to secure the area. It is a very complex mission and I will only authorize you to lead it if you have demonstrated competence. Serve our people by successfully completing the lesser raids here in the forest. Bring me the Golden Medal of the Shar Vahl as proof of your prowess, or, if you are already at least as powerful as I am, there is another [" .. eq.say_link("test") .. "] that will give me confidence in your abilities.");
	elseif e.message:findi("test") then	
		e.self:Say("If you are less experienced than I am, performing this task will gain you nothing. With that in mind, take this box and venture through the mines and into the caverns. Combine in it Gooplart's tooth, Gizgargank's scalp, Grikplag's skull, Gnildaria's eye, Gnerpokkel's heart, Gilgaplank's toes, the husk of the summoned burrower, and the shackles of a Vah Shir captive. Return to me with the Box of the Hero of Shar Vahl and I will send a team of our veterans to escort you into battle.");
		e.other:SummonItem(17867);  --Box of the General's Challenge
	end
end

function event_trade(e)
    local item_lib = require("items");
	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5989})) then --Golden Medal of Shar Vahl
        e.self:Say("Take these battle plans and study them carefully. This will be the final strike in our effort to drive the grimling menace back into the acrylia mines.  Be wary, this will require more soldiers than any of our previous war efforts.  When you have gathered your forces, give the battle plans to Veteran Cullin and he will accompany you into battle.");
        e.other:QuestReward(e.other,0,0,0,0,6191,0);	--Staginar's Battle Orders
	elseif(e.other:GetLevel() >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6190})) then --Box of the Hero of Shar Vahl
		e.self:Say("Take these battle plans and study them carefully. This will be the final strike in our effort to drive the grimling menace back into the acrylia mines.  Be wary, this will require more soldiers than any of our previous war efforts.  When you have gathered your forces, give the battle plans to Veteran Cullin and he will accompany you into battle.");
        e.other:QuestReward(e.other,0,0,0,0,6191,0);	--Staginar's Battle Orders
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 34142})) then 	-- Magical Acrylia Obelisk
		e.self:Say(e.other:GetName() .. ", your actions have earned the respect of all Vah Shir. Upon your shoulders now rests the hope of our people. This hollow acrylia obelisk is the key that will gain you entry to the stronghold of the master of the grimling horde.  You will certainly encounter additional challenges on your upcoming journey.  The master will be within the deepest part of the stronghold.");
		e.other:QuestReward(e.other,0,0,0,0,5972,20000);  -- Hollow Acrylia Obelisk
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end
