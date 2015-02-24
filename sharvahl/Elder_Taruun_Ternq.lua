--Rogue --3
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5564})) then
		e.self:Say("I see that Joharr introduced you to our cavern dwelling friends. This report shows that you were very successful on your last patrol. Your progress as a Taruun is most pleasing. You have shown us that you are ready to advance to the level of apprentice. I will send someone for your new cloak in a moment. While I am doing that, please use this bowl to prepare some spicy fish stew and take it to Kerr Tiparr in the Hollowshade outpost. It's not often that they get good food out there. If you don't remember the recipe, just ask cook Mylis. When you are done, please return with your old cloak and the empty pot. Always remember... Service to the community should always precede any thoughts of personal advancement.");
		e.other:Faction(319,10);
		e.other:QuestReward(e.self,0,0,0,0,5570,1000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 5566, item2 = 3465})) then
		e.self:Say("Very well done," .. e.other:GetName() .. ". Take this cloak and wear it with pride. May it keep your silhouette hidden from our enemies and keep you safe from those things that may walk in shadows darker than ours. Your work is being noticed, young Taruun. Please keep a clear eye on the path that lies before you. Speak to Elam Arruk when you are ready to continue your training. You will need only to show him the cloak that I just gave you. He will know how to instruct you from there. Be well.");
		e.self:Shout("Hear me fellow Vah Shir! The Taruun have seen fit to escalate citizen " .. e.other:GetName() .. " to the rank of apprentice. He grows in strength and wisdom daily. We are proud as should you all be. May this student of our ways continue to progress and live worthy of our noble heritage.");
		e.other:Faction(319,20);
		e.other:QuestReward(e.self,0,0,0,0,5558,2500);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 5558, item2 = 6158})) then
		e.self:Say("Well done.  Take this new cloak and wear it with pride.  You can now be called journeyman!");
		e.self:Shout("Hear me fellow Vah Shir! The Taruun have seen fit to escalate citizen " .. e.other:GetName() .. " to the rank of journeyman. He grows in strength and wisdom daily. We are proud as should you all be. May this student of our ways continue to progress and live worthy of our noble heritage.");
		e.other:SummonItem(6275);
		e.other:QuestReward(e.self,0,0,0,0,6158,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
