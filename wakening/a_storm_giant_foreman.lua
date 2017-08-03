function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there scrawny! I lead the finest team of laborers in all of Kael Drakkel! We've got little use for a weak creature like yourself, but if you want to help us out I've got a [" .. eq.say_link("task") .. "] for you.");
    elseif(e.message:findi("task")) then
		e.self:Say("Those pansy dragon would bees in the Tunarean Court have become quite the nuisance lately. The deaths of Lord Gossimerwind and Lord Prismwing would certainly put an end to the nuisance for a time. Bring me their wings as proof of their deaths.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24870,item2 = 24871})) then -- 
		--e.self:Say("");
        e.other:Faction(42,-10); --#CoV
        e.other:Faction(188,10); --#k-rif
        e.other:Faction(189,10); --#k-zek
        e.other:Faction(179,10); --#King_Tormax
        e.other:QuestReward(e.self,0,0,0,0,24887,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end