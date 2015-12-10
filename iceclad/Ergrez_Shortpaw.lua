function event_say(e)
	if(e.message:findi("hail")) then
	    e.self:Say("works at skinning and cleaning the raw furs around him.");
    elseif(e.message:findi("what armor")) then
	    e.self:Say("Many armors.  All of animal hides from the islands.  If you wanting armor then I can make for you.  All I ask is you do me favor.");
    elseif(e.message:findi("what favor")) then
		e.self:Say("Snowfangs in need of much help lately.  Once we mighty but now weak.  You help us get stronger.  If you want armor of wolves or cougar then I need you bring twice as many materials.  For each thing you wanting I need thing.  Just tell me what furs you have and I tell you what I need.");
	elseif(e.message:findi("medium quality dire wolf fur")) then
	    e.self:say("Good wolf fur I make you cloak.  All it take for cloak is fur and skinning rock.  I need two skinning rock though.  I very low on rocks.");
	elseif(e.message:findi("low quality dire wolf fur")) then
	    e.self:Say("Bad fur I make into cap for head.  Keep your small furless skull warm.  You bring me two bark bindings for that.  Bindings for sewing.");	
	elseif(e.message:findi("low quality cougarskin")) then
		e.self:Say("More cat skin. You bring more meat but this time bring fatty walrus meat.  Many gnolls need for winter fat.  Keeps gnolls healthy.");
	elseif(e.message:findi("medium quality cougarskin")) then
	    e.self:Say("Grrrrr.  More cat.  All I need for this is cutting shells.  We not get them much but I need.");
	elseif(e.message:findi("high quality cougarskin")) then
	    e.self:Say("I not like making things of cat fur.  Smells bad, hurts nose.  You want me to work with that you bring food, lots of food.  You bring me mammoth meats.");	
	end	
end

function event_trade(e)

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30064,item2 = 30065,item3 = 30065})) then --  Medium Quality Cougarskin,  Cutting Shells
		e.self:emote("works with the fur for awhile by skinning it and sewing it");
		e.other:QuestReward(e.self,0,0,0,0,0,30020);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30030,item2 = 13407,item3 = 13407})) then --  High Quality CougarSkin, Mammoth Meat
		e.self:emote("works with the fur for awhile by skinning it and sewing it");
		e.other:QuestReward(e.self,0,0,0,0,0,30020);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30031,item2 = 30097,item3 = 30097})) then --  low Quality CougarSkin, Fatty Walrus Meat
		e.self:emote("works with the fur for awhile by skinning it and sewing it");
		e.other:QuestReward(e.self,0,0,0,0,0,30028);		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30025,item2 = 30062,item3 = 30062})) then --  Medium Quality Dire wolf fur, Skinning Rock
		e.self:emote("works with the fur for awhile by skinning it and sewing it");
		e.other:QuestReward(e.self,0,0,0,0,0,25019);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30023,item2 = 30063,item3 = 30063})) then --  High Quality Dire wolf fur, Bark Bindings
		e.self:emote("works with the fur for awhile by skinning it and sewing it");
		e.other:QuestReward(e.self,0,0,0,0,0,30029);	
		
	end
	
end
	--fiddle
