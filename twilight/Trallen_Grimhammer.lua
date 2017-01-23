function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings and well met ".. e.other:GetName() .. ". Don't listen to ol' Latrag over there he'll never stop brewin' the best durn ale to be found.");
	end
	if(e.message:findi("what boots")) then
		e.self:Say("For the boots yer gonna have to get me a sun jewel. a mark of destiny. and a fleshy vine.");
	end
	if(e.message:findi("what armor")) then
		e.self:Say("Latrag is goin' on 'bout his armor again isn't he. Well friend be ye a paladin?");
	end
	if(e.message:findi("i am a paladin")) then
		e.self:Say("Of course ya are ".. e.other:GetName() .. ". why would have ya asked me about the armor if ye wasn't eh. I have the [boots], [mask], [cloak], [gauntlets], [gorget], [girdle], and a [sword]. Which do ye want?");
	end
	if(e.message:findi("what mask")) then
		e.self:Say("For the mask yer gonna have to get me a moon jewel. a mark of blessings. and some crystallized dew.");
	end
	if(e.message:findi("what cloak")) then
		e.self:Say("For the cloak yer gonna have to get me a star jewel. a mark of the steadfast. a lexicon of the sun. and some glade dew.");
	end
	if(e.message:findi("what gauntlets")) then
		e.self:Say("For the gauntlets yer gonna have to get me a cloud jewel. a mark of honor. and some naturally formed quartz.");
	end
	if(e.message:findi("what gorget")) then
		e.self:Say("For the gorget yer gonna have to get me a sky jewel. a mark of gallantry. and a lunar marked stone.");
	end
	if(e.message:findi("what girdle")) then
		e.self:Say("For the girdle yer gonna have to get me a meteor jewel. a mark of heart. a lexicon of the moon. and a dread leech eye.");
	end
	if(e.message:findi("what sword")) then
		e.self:Say("For the sword yer gonna have to get me an astral jewel. a mark of the noble. a hardened clay sculpture. and a runic ear plug.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item2 = 5904, item3 = 5905})) then
		e.other:SummonItem(3978);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5908, item3 = 5909, item4 = 5910})) then
		e.other:SummonItem(3980);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5911, item3 = 5912})) then
		e.other:SummonItem(3981);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5915, item3 = 5916, item4 = 5917})) then
		e.other:SummonItem(3983);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5913, item3 = 5914})) then
		e.other:SummonItem(3982);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5906, item3 = 5907})) then
		e.other:SummonItem(3979);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5918, item3 = 5919, item4 = 5920})) then
		e.other:SummonItem(3984);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
