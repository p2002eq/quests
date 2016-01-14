function event_signal(e)
	if(e.signal == 1) then --Night
		eq.move_to(6,777,66,128,1);
	elseif(e.signal == 2) then --Day
		eq.move_to(4,690,69,128,1);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
	    e.self:Say("Taian Testing This");
		--need text Says Signals Chamberlain on perl
	elseif (e.message:findi("Greeting and good fortune to you, honored Dain Frostweaver IV")) then
		if (e.other:GetFaction(e.self) >= 5) then -- indifferent or higher
			e.self:Emote("seems to stare right into your soul with his one good eye. A chill runs down your spine.");
			--Suppose to Signal Chamberlain with something
		elseif (e.other:GetFaction(e.self < 5)) and (e.other:GetFaction(e.self) >= 3) then --Kindly or Amiable
			e.self:Emote("smiles at you and nods his head indicating he has been pleased with your progress.");
		else --Ally or Warmly
			e.self:Say("Greetin's and good fortune to yerself, "..e.other:Race()..". Chamberlain Krystorf speaks highly of the deeds you have performed for our people and so I welcome you to my Keep. I ask you now to take up a most dangerous duty for our people. Would you accept such a challenge from the King of a people not your own?");
		end
	elseif (e.message:findi("accept")) and (e.other:GetFaction(e.self) < 3) then --Must be Warmly or ally
			e.self:Emote("smiles at you with pride");
			e.self:Say("Something told me you would, "..e.other:GetName()..". For years upon years the plagues of King Tormax have been unleashed upon my people. And indeed it was also by Tormax's hand that me own father, Dain Frostreaver the Third was slain. My attempts at assassinating him have only met with failure, and our forces, while strong, are not yet mighty enough to assault Kael Drakkel. Therefore I have ye and yer companions as my last hope, "..e.other:GetName()..". Kill that bastard who calls himself King Tormax... and bring me his head!");
	elseif(e.message:findi("mission")) and (e.other:HasItem(8898)) then 
		e.self:Say("After General Bragmur has equipped the armor you have created for him, give him these orders. He is a skilled diplomat and will need to reach the pirate Gnomes. We must enter into a pact with them. We will supply them the velium that they need to build their silly gadgets, and they will take their ship back to Antonica and call for reinforcements from out ancestors. We hope they will acceppt this pact, after all Brell has been known to align himself with Bristlebane whom the Gnomes of Iceclad follow. You may be an important [factor] in their success.");
	elseif(e.message:findi("factor")) and (e.other:HasItem(8898)) then
		e.self:Say("I fear that spies lurk in every corner. You may need to help the General reach the gnomish camp if the Kromrif have gotten word of our efforts. You should call on any allies that you have to assist in case they ambush you. Brell bless you "..e.other:GetName()..", good luck.");
		
	end
end
	
function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1500, item2 = 30164})) and (e.other:GetFaction(e.self) <= 5)  then --Need indiff or higher faction
		e.self:Say("The people of Thurgadin are in your debt, "..e.other:GetName()..". Please accept the Coldain Hero's Ring as a token of our gratitude. The curse has been removed from the blade as well. I hope you find it useful against our common foes. When you are interested in assisting me further please show me the blade. Until that day, may Brell bless and protect you.");
		e.other:Faction(49, 50); --Coldain
		e.other:Faction(67, 50); --Dain
		e.other:Faction(188, -50); --Kromrif
		e.other:Faction(189, -50); --Kromzek
		e.other:QuestReward(e.self, 0, 0, 0, 0, 30369, 4000000); --9th Ring
		e.other:SummonItem(1465); --Dirk of the Dain
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30516})) and (e.other:GetFaction(e.self) == 1)  then --Must be ally
		e.self:Say("You have done what no Coldain could do, "..e.other:GetName().."! This is indeed a glorious say in our people's history. In return for your invaluable service I present you with the Tri-plated Golden Hackle Hammer. Its magic is powerful and I am sure it will serve you well.");
		e.self:QuestSay(e.other, "Let it be know from this day forth that "..e.other:GetName().." and their companions are Heros of the Coldain Kingdom. King Tormax has been slain, it is a time for celebration. Let no tankard go unfilled!");
		e.other:Faction(49, 100); --Coldain
		e.other:Faction(67, 100); --Dain
		e.other:Faction(179, -100); --King Tormax
		e.other:SummonItem(30502); --Tri-Plated Golden Hackle Hammer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1465}) and (e.other:GetFaction(e.self == 1))) then --Must be ally
		e.self:Say("My good "..e.other:GetName()..", you have served me well. You have flushed out all who sought to oppose me and my people. I am afraid I need to call upon you and your friends one final time. The dissention and treason ran deeper than I had anticipated. Our population has been cleansed, but we lost a full third of our army to the poisonous words of those rebels. In retaliation for your deeds, the Kromrif have made plans to attack us in this, our weakest hour. Can I count on your help outlander?");
		e.other:SummonItem(1465); --Dirk of the Dain
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1199} or {item1 = 8895})) then
		e.self:Say("Ah "..e.other:GetName()..". I was hoping to see you. We require your skilled hand. The Armory is overtaxed preparing armor for the war we are preparing to wage on the Kromzek. We need you to help by creating some Field Plate for a mission that is near to execution. Go see Loremaster Solstrin in the Hall of Ancestors, give him these orders. He holds the lore recorded on how to make the field plate. Return to me when you have completed a Standard Issue Kit.");
		e.other:SummonItem(1199); --Runed Prayer Prayer Shawl (Dain approved)
		e.other:SummonItem(8896); --Royal Coldain Orders
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8886})) then	
		e.self:Say("Excellent work "..e.other:GetName()..". If I didn't know I would assume this was made by our most skilled artisans.  You must hurry, General Bragmur has formed camp in Iceclad. Take the kit to the General, he had to drudge forward without any armor. His [mission] must be a success if we hope to successfully defend Thurgadin against the Giants.");
		e.other:SummonItem(8898); --Approved Issue Kit
		e.other:SummonItem(8897); --Expedition Orders
	end
	item_lib.return_items(e.self, e.other, e.trade)	
		
end

