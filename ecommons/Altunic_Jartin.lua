function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:SetRunning(true);
	elseif(e.wp == 3) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler! Have you need of provisions or perhaps other wares? I sell what I find upon the battlegrounds of the Commonlands.");
	elseif(e.message:findi("Where is your house")) then
		e.self:Say("Follow me.");
		eq.move_to(4791.06,-83.55,-51.47);
		eq.unique_spawn(22196, 0, 0, 4707.63, -105.49, -51.47);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18896})) then
		e.self:Say("You are the one they have sent? A squire?!! I hope you can help me. I gather items strewn upon the grounds of the Commonlands. I sell them at good prices. Lately, I have been terrorized by a human rogue named Narl. He will no doubt appear at my [house] soon. Bring his head to me.");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13867})) then
		e.self:Say("You have performed a great service to me, but I fear others will attack me while I stroll the countryside. It would be very noble of you to fetch me a cloth shirt for protection from wicked creatures. It is not much, but it will help.");
		e.other:Ding();
		e.other:Faction(105,-1,0);
		e.other:Faction(311,1,0);
		e.other:Faction(184,1,0);
		e.other:AddEXP(500);
		e.other:GiveCash(7,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1004})) then
		e.self:Say("Thank you. You are very noble for a squire. I can see you becoming a very valuable asset to the Hall of Truth. Take this token. Tell Merko that you have [earned the Token of Generosity].");
		e.other:Ding();
		e.other:SummonItem(13865);
		e.other:Faction(105,-1,0);
		e.other:Faction(311,1,0);
		e.other:Faction(184,1,0);
		e.other:AddEXP(500);
	end
end

-- END of FILE Zone:ecommons  ID:22058 -- Altunic_Jartin 