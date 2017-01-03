-- Aldikar in Ring War event in GD

function event_spawn(e)
	stage0 = false;
	stage5 = false;
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("And a good day to you, "..e.other:GetCleanName().."!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if stage0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30369}) then -- 9th ring
		e.other:SummonItem(30369); -- hands back ring
		e.other:SummonItem(18511); -- orders for Zrelik
		e.other:AddEXP(20000);
		e.self:Say(string.format("Commit these orders to memory, %s, have them ready to speak at a moment's notice. Tell your soldiers to prepare themselves. When the orders are handed to Zrelik we will take up our positions.",e.other:GetCleanName()));
		eq.set_timer("handin1", 300000); -- timer action is in encounter
		stage0 = false;
	elseif stage5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30369, item2 = 1739}) then -- Narandi's Head and 9th ring
		e.self:Emote("unsheathes a knife and shaves the beard from Narandi's face and returns the head to you, 'The Dain will require the beard for his trophy room, please accept this ring on his behalf. May it's effect aid you as you have aided us. Be certain to present the ring to the Dain when you're in town. If you remain an ally he will be most gracious, but be warned, if you fall from his good graces he will keep the ring.'");
		e.self:Say("Show the head to the surviving heroes quickly, we must report to the Dain and tend to the wounded.");
		
		e_other:Faction(49, 50); --Coldain
		e_other:Faction(67, 20); --Dain
		e_other:Faction(188, -80); --Kromrif
		e_other:Faction(189, -40); --Kromzek
		e_other:SummonItem(1741); -- Shorn head
		e_other:QuestReward(e_self, 0, 0, 0, 0, 30385, 1000000); -- 10th ring and big exp hit!
		
		eq.stop_timer("WarEnd");
		eq.set_timer("WarEnd", 300000); -- timer action in encounter
		stage5 = false;
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if e.signal == 100 then
		stage0 = true;
	elseif e.signal == 105 then
		stage5 = true;
	end
end