function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 1) then
		e.self:Say("Luckily for you someone found it.");
		e.other:SummonItem(2873);
	elseif(e.message:findi("cloak") and tonumber(qglobals.Shar_Vahl_Cit) == 7) then
		e.self:Say("Someone found a grimling wearing this in the pit. Try not to lose it this time.");
		e.other:SummonItem(2878);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I know many of the taverns and eateries have their own barrels, but you may want to try Jakhal and Kahala's Brewery. You can find it in the southwestern section of the Merchant's Quarter, or Corridor of Heroes, as I like to call it..");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 30962})) then
		e.other:QuestReward(e.self,0,0,0,0,15225);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18551})) then -- Dar Khura Guild Summons
		e.self:Say("Good " .. e.other:GetName() .. ", I am honored to meet you. You have come of age and it is time for you to register for citzenship of Shar Vahl. The Dar Khura, spiritual guides of our people, have sensed your spirit and deem you to be worthy of our training. First things first, take this application to Registrar Bindarah and return to me with proof of citzenship.");
		e.self:Say("I know that you may be nervous right now... after all, this should be very exciting first step for you. If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions. They will most likely know where to find the place or person that you are looking for.");
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2873,100); -- Application for Citizenship
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 2897})) then
		e.self:Say("Welcome back, " .. e.other:GetName() .. "! I see that your documents are in order and you are an official citizen of Shar Vahl, which is great news! Let me be the first to welcome you to the ranks of the Dar Khura! Here, take this cloak and wear it with pride.");
		e.self:Say("Present your acrylia slate to spiritist Fehril and he will guide you through your early training. May the strongest of our ancestral spirits be your inspiration.");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2878,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
