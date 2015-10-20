function event_spawn(e)
	eq.set_timer("depop",180000); --this triggered mob is only available for three minutes then depops
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I... am... the... Master... of... Elements.. Elements... Forgive... me. I am... unaccustomed.. to.. speaking.. this.. mortal... tongue. Might.. you... be... the... One?");
	elseif(e.message:findi("i am the one")) then
		e.self:Say("Trilith... Magi'kot.. knelt.. before.. the.. orb.. in.. his.. his.. last.. few.. moments... of.. mortal.. life. He... too... believed.. that.. he.. had.. the.. power.. and.. balance.. needed.. to.. grasp... control.. of.. the.. elements. He.. was.... flawed. Coming.. to... me... is.. a.. matter.. of.. no.. small.. import. Only.. only... one.. who.. is.. of.. balance.. and.. power... power.. may.. control.. the.. Orb.. of... Mastery. Give.... give.. me.. the.. Elements.. you.. have... gathered.. and.. I.. shall.. see.. if.. you.. are.. ready.. ready.. to control.. the... Elements.. of... life.. life.. life.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29683})) then -- Scout Tools
		eq.spawn2(120115,0,0,-3501,-4868,-108); -- a Kromzek Captain
		eq.spawn2(120121,0,0,-3507,-4897,-106); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3496,-4874,-109); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3474,-4863,-114); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3463,-4852,-117); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3452,-4841,-119); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3441,-4830,-122); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3430,-4819,-124); -- Kromzek Warrior
        e.other:Faction(42,30);   --Claws of Veeshan
		e.other:Faction(362,30);  --Yelinak
		e.other:Faction(189,-20); --Kromzek
		e.other:QuestReward(e.self,0,0,0,0,0,100000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29684})) then --Broken Disk
	    e.other:Faction(42,30);   --Claws of Veeshan
        e.other:Faction(362,30);  --Yelinak
        e.other:Faction(189,-20); --Kromzek
        e.other:QuestReward(e.self,0,0,0,0,29688); --Scout Report
        e.other:QuestReward(e.self,0,0,0,0,29685,100000); --Robe of Benevolence
        
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29685})) then --Robe of Benevolence
        e.other:QuestReward(e.self,0,0,0,0,29686); --Bracer of Benevolence
    
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29686})) then -- Bracer of Benevolence
        e.other:QuestReward(e.self,0,0,0,0,29687); --Talisman of Benevolence
    
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29687})) then --Talisman of Benevolence
        e.other:QuestReward(e.self,0,0,0,0,29685); --Robe of Benevolence
        
        
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
	eq.stop_timer("depop");
end


-- fiddle