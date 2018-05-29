--Tabben_Bromal (202151)
--Zone:  Plane of Knowledge



function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("Hail, Tabben Bromal")) then
		e.self:Say("What is it? What do you wan. . . Oh bloody underfoot, do forgive me, traveler. I'm not used to all this bickering and flittering about -- you know, the bustle of the 'living' city. The racket, the noise, and the wails of the children. Bah! I came here to escape it, not to relive it. But if I survived it once, I sure as Brell's holy bottom will do it again! In hopes of getting you all out of here as soon as possible and the peace and quiet being resurrected out of your blessed absence, I've agreed to lend some of my knowledge of the more inferior levels of tinkering to those who have an interest in this art. If you don't intend on purchasing any materials, then be off with you and leave me in peace. However, if you have coin in your pocket and you plan on spending, then do so quickly. I have more pressing things to do with my time than wait while you leisurely browse my wares.");
	elseif(e.message:findi("ready") and tonumber(qglobals.clockwork_talisman) == 1) then
		e.self:Say("Very well. You'll need to gather up a dense hammered casing for the outer shell; a crystalline carapace will act to protect the face of the device; and it requires a fiery power source to propel the rotor mechanism. The device is then attached around the neck, much like the one you are wearing. The only difference will be the strands of living chain that will keep it from slipping from around your neck. Place those four items and your talisman in that box and return it to me. We should be able to get this thing built for you without much fuss at all, should all things go well on your end of the task, of course.");
		e.other:SummonItem(17278);	--Small Parts Container
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28278})) then	--Strange Jewelers Schematic
		e.self:Emote("takes the document from you and looks at it for a moment. 'Well, this is a beautiful looking schematic. I wonder what they are trying to make with it? Where did you get this? No wait; don't tell me. I'd rather not know. I can make some of this writing out but just barely. What I can read leads me to believe that I'd be better off not knowing.'");
		e.self:Emote("falls victim to his curiosity and grabs a small kit from the table behind him. 'Take this kit and look for the following parts,' he says as he scrunches his nose at the schematic again. 'We'll need a Tri-coated Metal Casing, one Size C spring, some Creeping silk strands -- whatever those are -- and some Congealed Bile-based Ooze. I'm not sure if this thing is wanting us to make a device or some sort of nasty cocktail, but that's what it's asking for... ewww!'");
		e.self:Say("Seal those things up in the container that I just gave you and bring it straight back to me. I'll wait here for you and see if I can decipher anymore of this schematic."); 
		e.other:QuestReward(e.self,0,0,0,0,17277);	--Small Parts Kit
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28283})) then	--Sealed Parts box
		e.self:Say("Oh, you've returned! Very good, " .. e.other:GetName() .. "! Saria and I have made some real progress on the document that you brought us. Watch this and you'll see what I mean!");
		e.self:Emote("quickly opens the small case and removes the parts. He takes a tiny spanner, several small bolts, and a long wire and quickly pieces together what appears to be a small clockwork talisman. He pulls a leather string through the top of it and offers it to you.");
		e.self:Say("That should work for you, but from what we gathered, there's another layer of mechanics that works to shield and envelope the existing talisman. It's going to require more parts. So take this container and let me know when you're [" .. eq.say_link("ready") .. "] to write down the names of the next set of parts.");
		eq.set_global("clockwork_talisman","1",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,28284,100000);	--Small Clockwork Talisman (Necklace #1)
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28289})) then	--Locked Parts Box
		e.self:Emote("once again opens the case and begins to tinker with the items. Moving ever so swiftly and gently, he changes the talisman.");
		e.self:Say("take this schematic to Elder Clinka in the Plane of Tranquility. He should be able to decifer it for you.");
		eq.set_global("clockwork_talisman","2",5,"F");
		e.other:SummonItem(28290);	--Powered Clockwork Talisman
		e.other:QuestReward(e.self,0,0,0,0,28291,125000);	--The Talisman Schematic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
