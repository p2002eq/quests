--Rytan's Progressive Fletching Quest
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ", I trust all is well with you today. Come in and have a look around, just let me know if you see anything you like. By the way, I am in need of the assistance of an official Shar Vahl citizen. If you know of any please send them my way.");
	elseif(e.message:findi("citizen")) then
		e.self:Say("Wonderful! Please, show me your acrylia slate and I'll disclose my errand.");
	elseif(e.message:findi("grimling fang darts")) then
		e.self:Say("A grimling fang combined with a bone shard will make a dart slightly better than the xakra tooth dart, which will also sell for slightly more.");
	elseif(e.message:findi("grimling fangs")) then
		e.self:Say("The grimlings are the beings who attack our people around the Acrylia mines. They have the ability to use magic against us. Be careful if you wish to travel north. We have been waging war in that area.");
	elseif(e.message:findi("rockhopper talon darts")) then
		e.self:Say("Rockhopper talon darts are slightly better than grimling fang darts and will sell for a little more. The hooked dart crafting tool and a rockhopper foot will yield one of these darts.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then -- Acrylia Slate of Shar Vahl
		e.self:Say("Here's my dilemma, I am low on darts to sell and I need to replenish my supply. I simply cannot break away from the store so I require your help. Fill this bag with xakra teeth and return the sealed bag to me. With those teeth I can make six darts and I'll give you three.");
		e.other:SummonItem(2877); -- Acrylia Slate of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,17231); -- Rytans Bag
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3461})) then -- Rytans sealed bag
		e.self:Say("Here are the three darts I promised you and a seal of mine. I need more darts desperately, so show me your acrylia slate to take another bag and fill it as you are able. Collect four of my seals and show them to me. I will reward you by revealing my method of dart construction.");
		e.other:SummonItem(3463,3); -- 3x Xakra tooth dart
		e.other:QuestReward(e.self,0,0,0,0,3464); -- Seal of Rytan
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3464, item2 = 3464, item3 = 3464, item4 = 3464})) then -- 4x Seal of Rytan
		e.self:Say("I thank you for your continued assistance, " .. e.other:GetName() .. ". Here is a fletching tool that will enable you to fashion xakra tooth darts. You will first need to acquire a grimling skeletal femur and place it in a fletching kit with the tool. This will result in three bone shafts. Place a bone shaft, a xakra tooth and this tool in the fletching kit to make a dart. When your fletching skill no longer increases by making these darts you may give me your crafting tool and I will help you to upgrade it.");
		e.other:QuestReward(e.self,0,0,0,0,3467,1000); -- Xakra Dart Crafting Tool
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3467})) then -- Xakra Dart Crafting Tool
		e.self:Say("I assume you are ready to make more challenging darts. Very well, attach this shaft to your crafting tool in a fletching kit and you will be able to make grimling fang darts. Keep in mind that once this is done you will lose the ability to craft xakra tooth darts. When the grimling fang darts become trivial you may wish to upgrade your tool again by giving me the grimling dart crafting tool.");
		e.other:SummonItem(3467); -- Xakra Dart Crafting Tool
		e.other:QuestReward(e.self,0,0,0,0,3471); -- Crafting Tool Shaft Attachment
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3472})) then -- Grimling Dart Crafting Tool
		e.self:Say("Your skill is increasing rapidly, " .. e.other:GetName() .. ". Here is a hook to place on the end of your crafting tool that will enable you to fashion rockhopper talon darts. Once the tool is modified it will not be able to make other types of darts. When creating rockhopper talon darts becomes trivial to you, feel free to give it to me for another upgrade.");
		e.other:SummonItem(3472); -- Grimling Dart Crafting Tool
		e.other:QuestReward(e.self,0,0,0,0,3473); -- Crafting Tool Hook Attachment
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3474})) then -- Rockhopper Dart Crafting Tool
		e.self:Say("Here is a special handle to attach to your crafting tool. This is the final improvement to your tool and will enable you to craft owlbear feather darts. These darts are superior to even the rockhopper darts and are magical. Take your modified tool and combine it with an owlbear feather in your fletching kit. May your new skill serve you well, " .. e.other:GetName() .. ".");
		e.other:SummonItem(3474); -- Rockhopper Dart Crafting Tool
		e.other:QuestReward(e.self,0,0,0,0,3477); -- Crafting Tool Handle Attachment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
