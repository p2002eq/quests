---- Quest:Steaon's Deliveries
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Hello there friend. My name is Gearo and as you can see I'm a Gnome, so what can I do for ya?");
	elseif(e.message:findi("take the gems") and tonumber(qglobals.DeliveredToGearo) == 1) then
		e.self:Say("Good " .. e.other:GetName() .. "! Here they are, please take them back to that gargantuan barbarian and let him know I want a raise for all this hard work!");
		e.other:SummonItem(4767); -- Bag of Assorted Gems
		eq.delete_global("DeliveredToGearo"); -- Remove global
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4766})) then -- Assorted Tailoring Supplies
		e.self:Say("Ah you were sent from Steaon I see. So what's that tall drink of water up too? He must be busy at the store if he has you delivering his supplies for him. Well enough about all that. If he has trusted you to bring his supplies here I suppose I can give you these gems I picked up for him. Will you [" .. eq.say_link("take the gems") .. "] to him?");
		e.other:Faction(338, 25); -- Traders of the Haven
		e.other:Faction(152, 2); -- House of Fordel
		e.other:Faction(153, 2); -- House of Midst
		e.other:Faction(154, 2); -- House of Stout
		e.other:QuestReward(e.self,0,0,0,0,0,500); -- Faction and EXP
		eq.set_global("DeliveredToGearo","1",0,"D30");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end