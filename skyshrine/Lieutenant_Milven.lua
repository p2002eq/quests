function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Hmm, the guards at the gate sent a "..e.other:Race().." to assist with the [rampant problems]? They shall have to be replaced with functional sentries so this does not occur again, but that is another matter for later.");
	elseif(e.message:findi("rampant problems")) then
		e.self:Say("I trust that what is said here will not be repeated to outsiders, yes? Good. For some time now, we've been fortifying our position in the shrine to fend off giant attacks as they come. Though there hasn't been a major engagement between the shrine and the giants for quite some time, there have been strafing runs done by them in an attempt to test us. If you're up for it, I have a [mission] I need someone new to the shrine to complete.");
	elseif(e.message:findi("mission")) then
		e.self:Say("We've been looking for someone that isn't from the shrine to find some of the giants that have been on these strafing runs and have them eliminated. You're of the perfect ilk because they will not recognize you as a friend to the shrine. Once you pry their steel-plated helms from their cold, dead heads and bring them back to me, your worth will be proven and you may show promise as an ally to the shrine.");
	elseif(e.message:findi("assignment")) then
		e.self:Say("While the helmets of the giants are a good way to prove your worth, it really strikes home to the giants when they see some of their best warriors dead without their toes. If you can bring me back either Storm Giant toes or Frost Giant toes, you will not only show us that you are a friend to the shrine, but also that the giants are not as indestructible as they would have you believe.");
	end				
end

function event_trade(e)
	local heads = 0;
	local toes = 0;
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062, item3= 29062, item4 = 29062})) then
		heads = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062, item3= 29062})) then
		heads = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29062, item2 = 29062})) then
		heads = 2; 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29062})) then
		heads = 1;		
	end
	
	if (heads > 0) then
		repeat
			e.self:Say("Well done, "..e.other:GetName()..". You are proving to be worth the risk of sending a new recruit out on a mission such as this. If you feel this is the type of mission you're best suited for, feel free to slay more of these beasts and return their helmets to me. The fewer giants there are out there, the less chance they continue their random attacks against us. I also may have another [assignment] for you if you're interested.");
			e.other:Faction(42, 15); --CoV
			e.other:Faction(362, 3); --Yelinak
			e.other:Faction(189, -7); --Kromzek
			e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 150);
			heads = heads - 1;
		until heads == 0	
	end
	--Storm Giant Toes 29124 and Frost Giant Toes 29125 can be turned in together.
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124, item2 = 29124, item3 = 29124, item4 = 29124})) then
		toes = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29125, item2 = 29125, item3 = 29125, item4 = 29125})) then
		toes = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124, item2= 29124, item3 = 29124})) then
		toes = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29125, item2 = 29125, item3 = 29125})) then
		toes = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124, item2 = 29124, item3 = 29125})) then
		toes = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124, item2 = 29125, item3 = 29125})) then
		toes = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124, item2 = 29124})) then
		toes = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29125, item2 = 29125})) then
		toes = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124, item2 = 29125})) then
		toes = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29124})) then
		toes = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29125})) then
		toes = 1;							
	end

	if (toes > 0) then
		repeat
			e.self:Emote("chuckles as he looks at the toes of the giants.");
			e.self:Say("You have indeed proven yourself to me, and in doing so to the shrine. Keep it up and you'll be on your way to becoming a great ally to the shrine. We appreciate your efforts in this matter greatly, and if you choose to continue your endeavors in this matter, we won't hold it against you.");
			e.self:Emote("gives you a sly grin before going back to his work.");
			e.other:Faction(42, 7); --CoV
			e.other:Faction(362, 1); --Yelinak
			e.other:Faction(189, -3); --Kromzek
			e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 250);
			toes = toes - 1;
		until toes == 0
	end

	item_lib.return_items(e.self, e.other, e.trade)		

end
