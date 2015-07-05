-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:emote("gives you a crooked smile. 'Hello there, " .. e.other:GetName() .. ". I'm doin some important 'meditations' to my god here. Maybe you can go somewhere else?'");
	end
end

function event_trade(e)
    local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20694})) then						--wizard test of conception using efreeti statuette, mithril air ring, box of winds
		e.self:Say("'Something for me then, eh?'  'NOOOO!' The pure cleansing light burns away the gnome without a trace of his existence except for a tiny ball of light which you pick up.");
		e.other:QuestReward(e.self,0,0,0,0,20697,100000); --solidate mithril ring
		eq.depop();
	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
