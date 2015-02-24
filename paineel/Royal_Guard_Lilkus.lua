function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You tread upon sacred ground, " .. e.other:Race() .. ". None may go further unless they [have business with the Overlord], or, if you're looking to gain favor with the heretics and need a little coin, I have a [job] for you.");
	elseif(e.message:findi("business")) then
		e.self:Say("The Overlord only sees those he calls forward. If you have a summons from him, I will escort you and announce your arrival. If not, then forget whatever business you may have had here. If you wish an audience, then go speak to Sheltian below. He may be able to help you.....if you help him.");
	elseif(e.message:findi("job")) then
		e.self:Say("There are many campaigns we administer from within our city, Paineel. Some of these campaigns are threatened or hindered by annoyances. One of these annoyances are the kobolds that live in the filth of a cave not far from here. Find that lair and kill as many of these beasts as you can. For every kobold molar you return, you shall be rewarded.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 1761})) then
		e.self:Say("Not bad, " .. e.other:GetName() .. ". Here is your reward. If you slay enough of these dogs, Sheltuin may have a more important task for you to perform.");
		local random_result = math.random(10);
		if(random_result == 1) then
			e.other:SummonItem(eq.ChooseRandom(3120,3123,3115,3117,3122,3113,3116,3118,3121,3124,3119,3108,3107,3111,3103,3105,3110,3101,3104,3106,3109,3112,3132,3135,3127,3129,3134,3125,3128,3130,3133,3136,3131));
		end
		e.other:Faction(143,1);  -- +Heretics
		e.other:Faction(79,-1);  -- -Deepwater Knights
		e.other:Faction(112,-1); -- -Gate Callers
		e.other:Faction(56,-1);  -- -Craftkeepers
		e.other:Faction(60,-1);  -- -Crimson Hands
		e.other:QuestReward(e.self,8,2,0,0,0,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75074 -- Royal_Guard_Lilkus
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------