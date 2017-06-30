-- Shaman Skull Quest 3 & 4
function event_say(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	if(e.message:findi("Rok Nilok") and (e.other:GetCharacterFactionLevel(282) > 6) and (tonumber(qglobals.shmskullquest) >= 5)) then
		e.self:Say("Take this chest. Inside you shall combine the skull of their leader and at least five of the caste members. You must then go to the swamp garrison and deliver the full chest along with your Iron Cudgel of the Mystic to Mystic Dovan. Go to him now and inquire of the Crusaders of Rok Nolok.");
		e.other:SummonItem(17035); -- A Skull Chest
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	local item_lib = require("items");
	if((tonumber(qglobals.shmskullquest) >= 3) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 18054})) and (e.other:GetCharacterFactionLevel(282) > 6)) then -- The Bone Garrison
		e.self:Say("At last!! The last three sent were not of sufficient power to brave the evils of the tower. Here is your container. I was to travel with you, but Warlord Zyzz insists that I stay on post. The skulls you seek are the ones belonging to the caste of bone brethren. Combine the five skulls of the caste and the one belonging to the leader inside the box and bring to me the full box along with your iron cudgel of the seer.");
		e.other:Faction(282, 10); -- Scaled Mystics
		e.other:Faction(193, 10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,17034,10000); -- A Skull Chest
		eq.set_global("shmskullquest","4",5,"F"); -- Completed Cudgel Quest 3.2
	elseif((tonumber(qglobals.shmskullquest) >= 4) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 12735, item2 = 5142})) and (e.other:GetCharacterFactionLevel(282) > 6)) then -- Full C.O.B.B. Chest and Iron Cudgel of the Seer
		e.self:Say("The temple will be pleased. As instructed by the hierophants, here is your iron cudgel of the mystic. You have done so well that I must ask you to also collect the [crusaders of Rok Nilok].");
		e.other:Faction(282, 10); -- Scaled Mystics
		e.other:Faction(193, 10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,2,4,1,5143,100000); -- Iron Cudgel of the Mystic
		eq.set_global("shmskullquest","5",5,"F"); -- Total Completion of Cudgel Quest 3
	end
	item_lib.return_items(e.self, e.other, e.trade)
end