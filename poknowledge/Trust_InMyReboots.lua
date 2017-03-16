-- Trust_InMyReboots (202346) in PoK for anniversary quest!

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Many things are left unseen here in Norrath. In order to keep the lag and glitches at bay, I need you to bring me a Clockwork Spider Thorax Plate so I can get this hammered into place.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if item_lib.check_turn_in(e.self, e.trade, {item1 = 10972}) then -- Clockwork Spider Thorax Plate  
		e.self:Say("This will dam things up for another day. Take this seal and make sure to ask around in case anyone else needs assistance!")
		e.other:QuestReward(e.self,0,0,0,0,34047) -- Trust's Seal 
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
