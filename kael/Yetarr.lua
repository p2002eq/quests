function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("".. e.other:GetName() .. ", your name has reached my ears more than a few times. Rumors fly that your kind will be the downfall of both the [" .. eq.say_link("dragons") .. "] and the [" .. eq.say_link("Coldain") .. "].");
	elseif (e.message:findi("dragons")) then	
		e.self:Say("The dragons are not my primary concern, Kyenka has a greater hatred for them. I leave matters regarding to them in his capable hands. My worries are of the Coldain.");
	elseif (e.message:findi("Coldain")) then	
		e.self:Say("I do not fully trust the [" .. eq.say_link("Kromrif") .. "] to keep Kael Drakkel protected from the menace of the tiny savages. The Kromrif do not actively seek to kill them. If the Coldain are left to breed they will one day swarm over Kael and no number of Kromzek warriors will be able to save us.");
	elseif (e.message:findi("Kromrif")) then	
		e.self:Say("I do not fully trust the Kromrif to keep Kael Drakkel protected from the menace of the tiny savages. The Kromrif do not actively seek to [" .. eq.say_link("assassinate",false,"kill") .. "] them. If the Coldain are left to breed they will one day swarm over Kael and no number of Kromzek warriors will be able to save us.");
	elseif (e.message:findi("assassinate")) then	
		e.self:Say("Perhaps assassinate is not the best word. I simply wish the death of some of the more compitent (sic) advisors of that foolish Dain. Within the halls of Icewell keep dwells a huntsman that has stood by the Dains side since he was a mere child. The court scribe is also more then he appears to be. Bring me their heads, I will reward you for each one. That is the only proof I will take of their deaths.");
	end

end
function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25122})) then
		e.self:Say("The death of this one must be causing great strife amoung the Coldain. Your work is greatly appreciated. I wish I could reward you with more, but these boots are among the few things I have to give.");
		e.other:Faction(188, 20); --kromrif
		e.other:Faction(189, 20); --kromzek
		e.other:Faction(179, 10); --KT
		e.other:Faction(42, -30); --CoV
		e.other:QuestReward(e.self, 0,0,0,0, 25027, 1750000);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25123})) then	
		e.self:Say("The death of this one must be causing great strife amoung the Coldain. Your work is greatly appreciated. I wish I could reward you with more, but these gloves are among the few things I have to give.");
		--Text borrowed and modified
		e.other:Faction(188, 20); --kromrif
		e.other:Faction(189, 20); --kromzek
		e.other:Faction(179, 10); --KT
		e.other:Faction(42, -30); --CoV
		e.other:QuestReward(e.self, 0, 0, 0, 0, 25026, 1750000);
	end

	item_lib.return_items(e.self, e.other, e.trade);

end
		
