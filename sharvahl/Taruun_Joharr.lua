--Rogue --3
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3466})) then -- Hardened Buckler of the Beetle
		e.self:Emote("takes the buckler and spins it in his hand for a moment. Eventually he says");
		e.self:Say("I suppose assumin' you were sent here by Harbin isn't too far from the reality of things. I'll try to think of a few things for you to do, but in the meantime, take these daggers and practice until you can use both of them. You need to get out of the habit of toting this shield around. If your enemy is gettin' close enough to hit you on it, you ain't doin' your job right anyway. I'll do what I can to train you from here, but I'm going to need to eat first. It's been a while since my last meal. Take this meal voucher to Cook Yalkiin. Once they fill the order bring it back and we'll start your lesson. Now scoot.");
		e.other:SummonItem(5560); -- Black Handled Dagger (Primary)
		e.other:SummonItem(5561); -- Black Handled Dagger (Secondary)
		e.other:QuestReward(e.self,0,0,0,0,5559); -- Meal Voucher
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5563})) then -- Bag of Food
		e.self:Emote("takes the bag and takes a huge bite of the sandwich.");
		e.self:Say("This sandwich is almost worth the wait.");
		e.self:Emote("rubs the crumbs from his mouth");
		e.self:Say("hope that you've been practicin' with those daggers. Elder Ternq came by while you were away. He stated that I, well... you... need to go scout the caves around the thicket. Gather the skulls of any Shak Dratha that you may... um... run into while you scout. Once you've filled this backpack, return it to me and I'll fill out a report for Ternq.");
		e.other:Faction(319,10); -- Taruun
		e.other:QuestReward(e.self,0,0,0,0,17607,1250); -- Worn Scoutpack
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5568})) then -- Pack of Skulls
		e.self:Say("Very good, " .. e.other:GetName() .. "! Elder Ternq will be very pleased with the results of your patrol. Take this regional status report to him and see if he has anything else for you to do. Your skill as a hunter is really starting to show. You can keep the daggers that I gave you. Make good use of them. I'm sure that you're going to be too busy to come back this way for a bit. Take care.");
		e.other:Faction(319,10); -- Taruun
		e.other:QuestReward(e.self,0,0,0,0,5564,1500); -- Regional Status Report
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
