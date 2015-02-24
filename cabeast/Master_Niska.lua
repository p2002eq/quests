function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("bows with elegance and grace. You can see her arms rippling with muscles.");
		e.self:Say("Greetings. We are the Swifttails. We are the harnessers of the elements. We are the tails of discipline. To achieve rebirth into our caste is a great honor indeed. We can be identified by our adornments. You should display that which we have given you to adorn your arms with pride. You do have your Shackle of Dust, correct?");
	elseif(e.message:findi("no")) then
		e.self:Say("You dare disgrace us?");
		e.self:Emote("hisses at you.");
		e.self:Say("If you have truely lost the marking of our caste, you will need to take this note and speak to the Toilmaster immediately. Read it on the way and praise the will of Cazic Thule.");
		e.other:SummonItem(18271); --A Ragged Book
	elseif(e.message:findi("yes")) then
		e.self:Say("Very good Broodling. Display your adornment with pride so that the enemies of the Brood may see our might as you rip through the weak will of their ranks. Now be gone from my sight.");
	elseif(e.message:findi("shackle of rock")) then
		e.self:Emote("strikes within inches of your snout with amazing speed.");
		e.self:Say("The Shackle of Rock is your interest? Then learn well our ways and prepare yourself. If the stone embraces your wrist, you are ready indeed. To complete the second rung you must find for me the [Fists of Talon].");
	elseif(e.message:findi("fists of talon")) then
		e.self:Emote("points to the Court Chronicler.");
		e.self:Say("All that is known of Talon has been chronicled. Should you obtain the fists then you shall hand them to me. This shall earn you the Shackle of Rock.");
	elseif(e.message:findi("troubles with an outlander")) then
		e.self:Say("It seems Klok Ephmir has encountered an outlander who was hunting the food we lizards enjoy. The legion will not act without proof of this outlanders existence. We were asked by the Baron to find this proof. We shall do this. You shall provide me with the outlanders head and the Shackles of Rock and Stone!!");
	elseif(e.message:findi("personal courier")) then
		e.self:Emote("grabs a tin box resting by her feet. 'Take this to Master Rinmark and be quick about it!!'");
		e.other:SummonItem(12829); --A Tin Box
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12797, item2 = 12798, item3 = 12799})) then
		e.self:Emote("removes a crudley hewn shackle. 'This is yours. It is one of the keys to the third rung. I see that you are truely a great monk and have studied your disciplines well. I have need of one as you. I have heard of [troubles with an outlander].'");
		e.other:SummonItem(4193);	--Shackle of Rock
		e.other:Faction(317,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12821, item2 = 4192, item3 = 4193})) then
		e.self:Say("Very good!! Here is your Shackle of Copper. The Emperor shall be pleased that I, Mistress Niska, have slain the outlander. Do you have some time? I need someone to be my [personal courier]. Will you?");
		e.other:SummonItem(4194); 	--Shackle of Copper
		e.other:Faction(317,20);
		e.other:Faction(193,10);
		e.other:AddEXP(40000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18466, item2 = 22921})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:SummonItem(7881);	--Mark of Clarity
		e.other:Faction(317,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18465, item2 = 22920})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:SummonItem(7881);	--Mark of Clarity
		e.other:Faction(317,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18272, item2 = 24770})) then
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all this time");
		e.self:Say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
		e.other:SummonItem(4190);	--Shackle of Dust
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("You dare disgrace us?' She hisses at you. 'If you have truly lost the marking of our castle, you will need to take this note and speak to the Toilmaster immediatley. Read it on the way and praise the will of Cazic-Thule.'");
end

--Submitted by: Senzo aka Fatty Beerbelly
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
