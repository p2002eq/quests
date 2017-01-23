function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("piercing eyes meets yours. ''Are ye a guest of Vornol's too? Have faith my friend but don't let that durn mage fool you, I know him better than anyone else. Well except for Valana of course.''");
	end
	if(e.message:findi("I am a cleric")) then
		e.self:Say("I thought you might be. I have some armor to reward those that prove to be most holy.");
	end
	if(e.message:findi("armor")) then
		e.self:Say("The armor I have is a helm, breastplate, vambraces, greaves, pauldrons, bracer, and boots. The rest you will have to get from my friend and guard Kayn. Just ask him about armor.");
	end
	if(e.message:findi("boots")) then
		e.self:Say("For the boots you must prove yourself by bringing me a star jewel, a mark of belief and a light etched sapphire.");
	end
	if(e.message:findi("bracer")) then
		e.self:Say("For the bracer you must prove yourself by bringing me a moon jewel, a mark of truth, and a light etched ruby.");
	end
	if(e.message:findi("breastplate")) then
		e.self:Say("For the breastplate you must prove yourself by bringing me a sky jewel, a mark of faith, genuine leather padding, and a brazier of light.");
	end
	if(e.message:findi("greaves")) then
		e.self:Say("For the greaves you must prove yourself by bringing me an astral jewel, a mark of purity, a lexicon of omens, and a candle of rites.");
	end
	if(e.message:findi("helm")) then
		e.self:Say("For the helm you must prove yourself by bringing me a cloud jewel, a mark of remedy, a vial of holy water, and a holy statuette.");
	end
	if(e.message:findi("pauldrons")) then
		e.self:Say("For the pauldrons you must prove yourself by bringing me a sun jewel, a mark of the divine, and decorative bracers of wistfulness.");
	end
	if(e.message:findi("vambraces")) then
		e.self:Say("For the vambraces you must prove yourself by bringing me a meteor jewel, a mark of the holy, a tome of deities, and a restored tapestry.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4839, item3 = 4840})) then
		e.other:SummonItem(3742);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4838, item2 = 4829, item3 = 4489})) then
		e.other:SummonItem(3741);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4798, item2 = 4797, item3 = 4796, item4 = 4492})) then
		e.other:SummonItem(3737);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4818, item3 = 4810, item4 = 4809})) then
		e.other:SummonItem(3739);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4795, item3 = 4793, item4 = 4794})) then
		e.other:SummonItem(3736);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4820, item2 = 4819, item3 = 4488})) then
		e.other:SummonItem(3740);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4799, item2 = 4493, item3 = 4808, item4 = 4800})) then
		e.other:SummonItem(3738);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
