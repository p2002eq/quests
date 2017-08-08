function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 == 18905})) then
		e.self:Say("Eh, strapling? Ye got this from me ol' partner? Huh. Aye, I know what it means but ye're not hearin'. Here, take this. It was his but he's not needin' it now.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5037,5029,13313),30000); -- Bronze Two Handed Battle Axe or Bronze Bastard Sword or Dwarven Axe
	end
end