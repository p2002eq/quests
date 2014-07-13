--Loveal_S-Nez.pl
--Sir Lindeal's Testimony/Thex Mallet/SK Trainer

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("What is this I see before me? A would-be hero of the Dead? You reek of false bravado. I have seen others much stronger than you meet their fate at the end of a blade. I see no reason to continue our conversation. How can one such as you assist with my [delegated duties]?");
	end
	if(e.message:findi("delegated duties")) then
		e.self:Say("Why do you ask? I know why. Glory has captured your affections. Those who seek glory find death. Still, you may be of some use. Before I assign you a task, I must be assured of your power. I require you to [perform a test].");
	end
	if(e.message:findi("perform a test")) then
		e.self:Say("In the Lavastorm Mountain Range there have been sightings of a paladin, one Sir Lindeal. He has compromised our routes between.. well, that is none of your concern. All you need to know is that this paladin of the Temple of Marr must be sent to his everlasting life. Do so and prove your worth to us. I await your proof. Use no assistance. If you are truly his equal then I shall know. I know all.");
	end
	if(e.message:findi("appointed tasks")) then
		e.self:Say("Very well. You have gained the appropriate power. I require you to journey to the Commonlands and seek out Kizdean Gix. He is a member of a very important force. Tell him 'Utalk Adarev Otcin'. Remember this password.");
	end
	if(e.message:findi("Thex Mallet")) then
		e.self:Say("All you can know is that the Thex Mallet is desired by our Queen. If we are not successful in its retrieval, it will be our heads which adorn her trophy room. We have learned its location and believe it to be broken into three separate pieces.");
	end
	if(e.message:findi("Queen Cristanos Thex")) then
		e.self:Say("The Queen of the Teir'Dal is the most powerful of all. It is she who should sit on the throne and not King Naythox. The Dead are her humble servants. We await the day when she shall finally take her rightful position as ruler of Neriak.");
	end
	if(e.message:findi("King Naythox Thex")) then
		e.self:Say("A competent and powerful warrior, but a warrior nonetheless. He has suppressed the true glory of the Teir'Dal. Perhaps it is time for a new ruler of Neriak.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18828})) then--Testimony
		e.self:Say("So you have succeeded where others have failed. You show promise. Take this then. You shall be a valuable asset to the Dead and soon this shall be of value to one so great. This will help you on your way. Are you still interested in my [appointed tasks]?");
		e.other:SummonItem(2317);--Cloak of the Undead Eye
		e.other:GiveCash(0,14,0,0);--14 silver
		e.other:AddEXP(33750);--1% level 16 exp
		e.other:Faction(322, 5); --The Dead
		e.other:Faction(268, 5); --Queen Cristanos Thex
		e.other:Faction(177,-10); --King Naythox Thex
		e.other:Faction(170,-10); --Keepers of Art
		e.other:Faction(91,-10); --Eldritch Collective
		e.other:Faction(260,-10); --Primordial Malice
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13390})) then--Thex Mallet
		e.self:Say("Oh how grand it is!! Look at it!! I feel the power trembling within. Who would have thought such an item would be abandoned? You have performed supremely. Queen Cristanos shall reward me greatly and I shall reward you greatly. Here is my weapon from years past.. the Reaper of the Dead. I believe it has one soul still trapped within.");
		e.other:SummonItem(5374);--Reaper of the Dead
		e.other:GiveCash(0,14,0,0);--14 silver
		e.other:AddEXP(33750);--1% level 16 exp
		e.other:Faction(322, 5); --The Dead
		e.other:Faction(268, 5); --Queen Cristanos Thex
		e.other:Faction(177,-10); --King Naythox Thex
		e.other:Faction(170,-10); --Keepers of Art
		e.other:Faction(91,-10); --Eldritch Collective
		e.other:Faction(260,-10); --Primordial Malice
	end
	--do all other handins first with plugin, then let it do disciplines
	
	item_lib.return_items(e.self, e.other, e.trade)
	end--END of FILE Zone:neriakc  ID:42043 -- Loveal_S`Nez

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
