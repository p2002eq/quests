function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ", it is good to see you. If you have come for the first stage of Khati Sha training please show me your acrylia slate.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2877})) then --Acrylia Slate of Shar Vahl
		e.self:Say("I have much for you to do " .. e.other:GetName() .. ". There is great need for capable Khati Sha in this new land. It is important that you progress speedily. We need to outfit you with the equipment that defines our chosen path. Well start with your battleclaws... But be aware of the fact that it will take you some time before can use both sets in combat. Just keep them both with you while you learn.");
		e.self:Say("Take this stitching pack and combine two shade silks from the xakra worms. Combine two of the resulting threads to make a bandage. Take this pattern and sew together three of the bandages. With considerable practice this will produce the handwraps that will be a foundation for your first sacred weapon. When you have created them return to me the scrap material.");
		e.other:SummonItem(17237); --Stitching Pack
		e.other:SummonItem(2877); --Acrylia Slate of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,3663); --Khati Sha Handwrap Pattern
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3665})) then --Shade Silk Scraps
		e.self:Say("Ahh, you have done well young one. Now it is time for you to create claws of your own, and those handwraps are the base. You will need a few things to complete them, however. Combine those handwraps in your stitching pack along with two sharp claws from the young rockhoppers in the pit around our city, as well as some forged fasteners.");
		e.self:Say("Im afraid I am unsure where you can find the fasteners, though you might ask Kagazz about them. You can find him over near the forges. Return and hand me both claws, and your cloak as proof of your deeds.");
		e.self:Say("Oh, and dont worry about destroying your handwraps. They are well made and though you may not be successful in making your claws, they will last. Now you best move along and get started, as we still have much to do!");
		e.other:QuestReward(e.self,0,0,0,0,0,300);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3673, item2 = 3674, item3 = 2878})) then --Primary Khati Sha Recruit Claw, Secondary Khati Sha Recruit Claw, Initiate's Cloak of Shar Vahl
		e.self:Say("I am greatly impressed with your work here. Very few recruits can make such claws, let alone master the technique. It is with great pleasure I present you a new cloak and welcome you as a full Recruit!");
		e.self:Shout("Attention everyone! It is with great pride and pleasure that I welcome " .. e.other:GetName() .. " to the ranks of the Khati Sha Recruits! " .. e.other:GetName() .. " has done our great city proud, and will continue to do great things!");
		e.self:Say("Now that you are a full recruit, it is time for you to move on with your training. Take my seal and seek out Mahron. He is a well traveled animist and can teach you many things. He is usually over near the bank. Be safe and well done, young one!");
		e.other:SummonItem(3673); --Primary Khati Sha Recruit Claw
		e.other:SummonItem(3674); --Secondary Khati Sha Recruit Claw
		e.other:SummonItem(3675); --Cloak of the Khati Sha Recruit
		e.other:QuestReward(e.self,0,0,0,0,3670,500); --Seal of Animist Poren
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
