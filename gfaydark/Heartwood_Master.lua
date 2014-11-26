function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, child of Tunare. As druids of the Mother of all, we may only use blunt weapons and the scimitar, all other blades are forbidden. Prove your devotion by bringing me a [rusty short sword], a [rusty long sword], a [rusty broad sword], and a [rusty bastard sword]. I will destroy them and reward your faith.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18786})) then -- Tattered Note
		e.self:Say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Here, put on this tunic, and let's get started.. you have much to learn.");
		e.other:Faction(304,100); -- soldier of Tunare
		e.other:Faction(178,15); -- King Tearis Thex
		e.other:Faction(99,15);  -- Faydark's Champions
		e.other:QuestReward(e.self,0,0,0,0,13537,200);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 5013,item2 = 5016,item3 = 5019,item4 = 5022})) then
		e.self:Say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
		e.other:Faction(304,1); -- soldier of Tunare
		e.other:Faction(178,1); -- King Tearis Thex
		e.other:Faction(99,1);  -- Faydark's Champions
		e.other:QuestReward(e.self,math.random(9),math.random(9),0,0,eq.ChooseRandom(5047,6012),250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54083 -- Heartwood_Master 