function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8467})) then -- Note for General Avilah
		e.self:Say("Thank you for delivering this. While I have you here, perhaps you can help. We are in dire need of assistance in the moor. All of the reports from our Taruun are indicating the same thing. The area has to be swept clear of the factions that currently inhabit it. The land itself seems defendable, we need someone to gather some soldiers and clear the area.");
		e.self:Say("If you accomplish this mission for us, I will be able to reward you for your actions in this leadership role. You will need only to return this box to me to collect your reward and promotion. It will need to contain a grimling chieftain staff, an owlbear guardian talon, a sonic wolf guardian fang, and your Journeyman's Cloak. Good luck to you, should you elect to accept this challenge.");
		e.other:QuestReward(e.self,0,0,0,0,17133,10000); -- Long Wooden Box
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8475})) then -- Box of War Trophies
		e.self:Say("You have proven to be a great leader and excellent soldier. Please accept this cloak as a symbol of your accomplishment. We would be proud to have you as a member of our ranks. You can choose to stay within the ranks of your sect or you can work with us was a member of the Shar Vahl Garrison. If you wish to continue your work as a member of the garrison, please take this form, sign it in triplicate and give it to Captain Darznel. Either way, please stand still, while I offer you our formal salutation.");
		e.self:Shout("Ahem... Citizens of Shar Vahl, Attention! It is my duty and honor as commander of the Shar Vahl Garrison to thank --name for their fine work. Give 'em your complete respect and salute 'em when you see them in passing. We enjoy our freedom, because of brave citizens like --name. Thank you for your time... Carry on!");
		e.other:SummonItem(8412); -- Dar Khura Garrison Cloak
		e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8488})) then -- Box of War Trophies
		e.self:Say("You have proven to be a great leader and excellent soldier. Please accept this cloak as a symbol of your accomplishment. We would be proud to have you as a member of our ranks. You can choose to stay within the ranks of your sect or you can work with us was a member of the Shar Vahl Garrison. If you wish to continue your work as a member of the garrison, please take this form, sign it in triplicate and give it to Captain Darznel. Either way, please stand still, while I offer you our formal salutation.");
		e.self:Shout("Ahem... Citizens of Shar Vahl, Attention! It is my duty and honor as commander of the Shar Vahl Garrison to thank --name for their fine work. Give 'em your complete respect and salute 'em when you see them in passing. We enjoy our freedom, because of brave citizens like --name. Thank you for your time... Carry on!");
		e.other:SummonItem(8409); -- Jharin Garrison Cloak
		e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8490})) then -- Box of War Trophies
		e.self:Say("You have proven to be a great leader and excellent soldier. Please accept this cloak as a symbol of your accomplishment. We would be proud to have you as a member of our ranks. You can choose to stay within the ranks of your sect or you can work with us was a member of the Shar Vahl Garrison. If you wish to continue your work as a member of the garrison, please take this form, sign it in triplicate and give it to Captain Darznel. Either way, please stand still, while I offer you our formal salutation.");
		e.self:Shout("Ahem... Citizens of Shar Vahl, Attention! It is my duty and honor as commander of the Shar Vahl Garrison to thank --name for their fine work. Give 'em your complete respect and salute 'em when you see them in passing. We enjoy our freedom, because of brave citizens like --name. Thank you for your time... Carry on!");
		e.other:SummonItem(8411); -- Khala Dun Garrison Cloak
		e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8491}) and (e.other:Class() == "beastlord")) then -- Box of War Trophies
		e.self:Say("You have proven to be a great leader and excellent soldier. Please accept this cloak as a symbol of your accomplishment. We would be proud to have you as a member of our ranks. You can choose to stay within the ranks of your sect or you can work with us was a member of the Shar Vahl Garrison. If you wish to continue your work as a member of the garrison, please take this form, sign it in triplicate and give it to Captain Darznel. Either way, please stand still, while I offer you our formal salutation.");
		e.self:Shout("Ahem... Citizens of Shar Vahl, Attention! It is my duty and honor as commander of the Shar Vahl Garrison to thank --name for their fine work. Give 'em your complete respect and salute 'em when you see them in passing. We enjoy our freedom, because of brave citizens like --name. Thank you for your time... Carry on!");
		e.other:SummonItem(8410); -- Khati Sha Garrison Cloak
		e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms

	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8491})) then -- Box of War Trophies
		e.self:Say("You have proven to be a great leader and excellent soldier. Please accept this cloak as a symbol of your accomplishment. We would be proud to have you as a member of our ranks. You can choose to stay within the ranks of your sect or you can work with us was a member of the Shar Vahl Garrison. If you wish to continue your work as a member of the garrison, please take this form, sign it in triplicate and give it to Captain Darznel. Either way, please stand still, while I offer you our formal salutation.");
		e.self:Shout("Ahem... Citizens of Shar Vahl, Attention! It is my duty and honor as commander of the Shar Vahl Garrison to thank --name for their fine work. Give 'em your complete respect and salute 'em when you see them in passing. We enjoy our freedom, because of brave citizens like --name. Thank you for your time... Carry on!");
		e.other:SummonItem(8413); -- Taruun Garrison Cloak
		e.other:QuestReward(e.self,0,0,0,0,8471); -- Garrison Enlistment Forms
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
