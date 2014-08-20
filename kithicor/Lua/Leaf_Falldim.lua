function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. "!  Respect the woods and all its inhabitants or face the wrath of the rangers.  Do not end up like [Maldyn Greenburn].");
	end
	if(e.message:findi("maldyn greenburn")) then
		e.self:Say("Maldyn was once one of us.  He was the finest of archers.  Everyone aspired to be like him.  He soon was tempted to hunt.  The animals of these woods found themselves nothing more than moving targets for Maldyn's training.  We held a trial and exiled him to parts unknown.  He would take with him Morin's [Bow of Kithicor].  I was asked to find a worthy ranger to [retrieve the bow].");
	end
	if(e.message:findi("bow of kithicor")) then
		e.self:Say("The Bow of Kithicor was carved from an ancient tree. It has great powers which were but a portion of the tree's mana. I seek a brave ranger to [retrieve the bow].");
	end
	if(e.message:findi("retrieve the bow")) then
		e.self:Say("Search the lands of the Unkempt Druids in the Rathe Mountains.  I have heard of his arrows being found inside its territories and  of his death wish to hunt down its leader.  Retrieve the bow and return it to me and I shall give you the ivy etched gauntlets.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(plugin::takeItems(12321 => 1, 12320 => 1)) then
		e.other:SummonItem(3190);
		e.self:Say("Very good, you have brought justice to these lands.");
		e.other:Faction(182,+30); -- kithicor residence
		e.other:Faction(265,+30); -- protectors of the pine
		e.other:Faction(159,+30); -- jaggedpine treefolk
		e.other:Faction(347,-60); -- unkempt druids
		e.other:AddEXP(10000);
	
	elseif(plugin::takeItemsCoin(0,0,2000,0, 12305 => 1, 12306 => 1)) then
		e.self:Say("Here are your boots.");
		e.other:SummonItem(3192);
		e.self:Say("Very good, you have brought justice to these lands.");
		e.other:Faction(182,+30); -- kithicor residence
		e.other:Faction(265,+30); -- protectors of the pine
		e.other:Faction(159,+30); -- jaggedpine treefolk
		e.other:Faction(347,-60); -- unkempt druids
		e.other:AddEXP(10000);
	
	elseif(plugin::takeItems(10059 => 1, 12328 => 1)) then
		e.self:Say("Here are your leggings.");
		e.other:SummonItem(3191);
		e.self:Say("Very good, you have brought justice to these lands.");
		e.other:Faction(182,+30); -- kithicor residence
		e.other:Faction(265,+30); -- protectors of the pine
		e.other:Faction(159,+30); -- jaggedpine treefolk
		e.other:Faction(347,-60); -- unkempt druids
		e.other:AddEXP(10000);
	end
	plugin::returnUnusedItems();
end


-- END of FILE Zone:kithicor  ID:20077 -- Leaf_Falldim


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
