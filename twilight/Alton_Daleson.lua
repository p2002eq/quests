function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to Jern's Rest!  I'm the owner and proprietor of this inn. its been in my family for generations.  My great grandaddy. Jern. built it back when Katta Castellum was first being built.  If ya be wantin' of anything don't hesitate to ask.'");
	end
	if(e.message:findi("armor")) then
		e.self:Say("His armor has also been in the family for generations, if ye be a [ranger] I don't have much use for it running this inn. I'll just need something in return for it.");
	end
	if(e.message:findi("ranger")) then
		e.self:Say("Excellent! If you are interested I have the Woodsman's [Helm], Woodsmand's [Mail], Woodsman's [Vambraces], Woodsman's [Greaves], Woodsman's [Bracer], Woodsman's [Boots], and the Woodsman's [Axe]. If you are interested in the rest of his armor you'll have to ask my wife Ellen, she'll have some errands you can run for her.");
	end
	if(e.message:findi("axe")) then
		e.self:Say("If you want the Woodsman's Axe you will have to aquire these items: a sun jewel, a mark of the naturalist, some ancient pottery, and a fossilized skull.");
	end
	if(e.message:findi("boots")) then
		e.self:Say("If you want the Woodsman's Boots you will have to acquire these items: a star jewel, a mark of timber, and a gilded steel rod.");
	end
	if(e.message:findi("bracer")) then
		e.self:Say("If you want the Woodsman's Bracer you will have to acquire these items: a moon jewel, a mark of lakes, and some lightning dust.");
	end
	if(e.message:findi("greaves")) then
		e.self:Say("If you want the Woodsman's Greaves you will have to acquire these items: an astral jewel, a mark of oceans, a pouch of fire stones, and a cat skin pouch.");
	end
	if(e.message:findi("helm")) then
		e.self:Say("For the Woodsman's Helm you will have to acquire these items: a cloud jewel, a mark of leaves, a frost covered leaf, and some sea grass.");
	end
	if(e.message:findi("mail")) then
		e.self:Say("To get the Woodsman's Mail you will have to acquire these items: a sky jewel, a mark of forests, a frozen vial, and a tro jeg brain.");
	end
	if(e.message:findi("vambraces")) then
		e.self:Say("If you want the Woodsman's Vambraces you will have to acquire these items: a meteor jewel, a mark of mountains, a tro jeg eye, and a solstice rune.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5852, item2 = 5853, item3 = 5851, item4 = 4488})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:AddEXP(25000);
		e.other:SummonItem(3958);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5695, item2 = 5694, item3 = 4490})) then
		e.other:SummonItem(3952);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5693, item2 = 5692, item3 = 4489})) then
		e.other:SummonItem(3951);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5689, item3 = 5687, item4 = 5688})) then
		e.other:SummonItem(3949);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5679, item3 = 5678, item4 = 5680})) then
		e.other:SummonItem(3946);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5682, item2 = 5681, item3 = 4492, item4 = 5683})) then
		e.other:SummonItem(3947);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5684, item2 = 4493, item3 = 5686, item4 = 5685})) then
		e.other:SummonItem(3948);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
