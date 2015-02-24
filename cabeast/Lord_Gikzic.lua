--Lord Gikzic is for the Greenmist quest line and administers the first two quests in the line.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You dare to intrude upon the presence of a Lord of Pain?!  Such foolish acts can only be those of a knight in training.  Are you a [knight in training]?");
	elseif(e.message:findi("knight in training")) then --Test of the Pawn (Greenmist Quest 1/8)
		e.self:Say("If you are a pawn, then let us begin with a simple test.  Complete the test and you shall be rewarded with a new khukri.  Do you [wish to perform the test of a pawn]?");
	elseif(e.message:findi("test of a pawn")) then --Test of the Pawn (Greenmist Quest 1/8)
		e.self:Say("You shall carry this pack.  Within it you shall combine 4 sarnak hatchling heads. When you have the full sarnak head pack then you shall return it to me along with your pawn's khukri and I shall reward you with the khukri of a knave. Beware, for the sarnak are our most hated foes and even their whelps are quite formidable fighters. Be sure to seek out Klok Mugruk. He may have some curscale armor available.");
		e.other:SummonItem(17017); --Sarnak Head Pack
	elseif(e.message:findi("greater concern")) then --Test of Pain (Greenmist Quest 2/8)
		e.self:Say("A tome has been taken from us. An expeditionary unit was returning to Cabilis when they were overtaken by a band of froglok raiders. The odds were greatly in their favor, but our forces would soon cut them down. Then, as abruptly as the battle began, it came to an end. The frogs retreated. The only item they took was an ancient tome entitled 'The Origins of Pain'. What the frogs want with it is unknown to us. Will you [retrieve the tome]?");
	elseif(e.message:findi("retrieve the tome")) then --Test of Pain (Greenmist Quest 2/8)
		e.self:Say("The tome ripped open in battle. There were but ten pages. This is one of those pages. You must find the remainder and the tome binder. Place the pages within the binder and once you combine them, the binder shall magically lock. Do not look upon the pages, for the words would bring a great madness upon you. Your task is simply to seek out the froglok raiders and return the magically locked tome to me. Return it with a knave's khukri and I shall give you a more powerful weapon.");
		e.other:SummonItem(18229); --Page 10 of Origins of Pain
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12381, item2 = 5120})) then --Test of the Pawn (Greenmist Quest 1/8)
		e.self:Say("You have learned to behead your opponents with great precision. Take the khukri of the knave. It shall prove most formidable in combat when wielded by a young crusader. You may now assist us with a [greater concern] than your training.");
		e.other:SummonItem(5121);
		e.other:Faction(62,20);
		e.other:Faction(193,10);
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,1,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12382, item2 = 5121})) then --Test of Pain (Greenmist Quest 2/8)
		e.self:Say("You have done as instructed. You are wise to hand this tome to me. It could bring you nothing more than insanity. As your reward, you shall have the squire's khukri. Soon you shall wield the knight's khukri, but that is for another Lord of Pain to decide.");
		e.other:SummonItem(5122);
		e.other:Faction(62,20);
		e.other:Faction(193,10);
		e.other:AddEXP(300);
		e.other:GiveCash(0,0,3,0);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
