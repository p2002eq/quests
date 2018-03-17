function event_spawn(e)
	eq.set_timer("depop",180000); --this triggered mob is only available for three minutes then depops
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Where am I? Oh god no, please let this be a simple nightmare. Please don't hold my withering soul here any longer!  Who are you? Why have you freed me? Please tell me it is over!");
	elseif(e.message:findi("arcanum of rosh")) then
		e.self:Say("I can never give up the Arcanum. It's bound to me, is a part of me now. It represents the sacrifice I made to me friends.  It be the only thing that brings me any sliver of happiness. Only if ye kin replace it with somethin' of sentiment to me will I hand over the book.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1711})) then
		
		e.other:QuestReward(e.self,0,0,0,0,1712,1000);
		eq.depop();
		eq.stop_timer("depop");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


function event_timer(e)
	eq.depop();
	eq.stop_timer("depop");
end