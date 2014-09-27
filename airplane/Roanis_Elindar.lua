function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! I offer to you three challenges. Summoning, Interpretation, and Displacement.  Please choose one of these.");
	elseif(e.message:findi("summoning")) then --magician test of summoning
		e.self:Say("Summoning it is. Proceed upward through the sky and return to me a Harpy Statuette, a Finely Woven Cloth Amice, and a Large Diamond. This will prove your abilities to me and I will reward you with a Drake Hide Amice.");
	elseif(e.message:findi("interpretation")) then --magician test of interpretation
		e.self:Say("Interpretation it is. Proceed upward through the sky and return to me a Carmine Spiroc Feather, a Blood Sky Amethyst, and a Golden Efreeti Ring. This will prove your abilities to me and I will reward you with the Duennan Shielding Ring.");
	elseif(e.message:findi("displacement")) then --magician test of displacement
		e.self:Say("Displacement it is. Proceed upward through the sky and return to me some Sweet Nectar, the Crown of Elemental Mastery, a Large Opal, and Djinni's Stave. This will prove your abilities to me and I will reward you with the Staff of Elemental Mastery.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20952, item2 = 20760, item3 = 20761})) then --magician test of summoning using harpy statuette, finely woven cloth amice, large diamond
		e.self:Say("Take this.");
		e.other:QuestReward(e.self,0,0,0,0,2708,100000); --Drake-hide amice
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20959, item2 = 20762, item3 = 20763})) then --magician test of interpretation using carmine spiroc feather, blood sky amethyst, golden efreeti ring
		e.self:Say("Take this.");
		e.other:QuestReward(e.self,0,0,0,0,11687,100000); --duennan shielding ring
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20966, item2 = 20764, item3 = 20766, item4 = 20765})) then --magician test of displacement using sweet nectar, crown of elemental mastery, large opal, djinni stave
		e.self:Say("Take this.");
		e.other:QuestReward(e.self,0,0,0,0,11568,100000); --staff of elemental mastery
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
