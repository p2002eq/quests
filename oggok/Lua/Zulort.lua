function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Um, you. Hi.. You Shaman of War now, right? You gotta learns war and war spells. We fights all and makes the Warlord likes us. You [gonna help] or me gonna feed you fat stoopid boddie to doggies.");
	elseif(e.message:findi("help")) then
		e.self:Say("Good. Warlord need many boddie.. I means Shamans of War.. to kill and gets killed.. no, ummm.. kill and smoosh for Him and makes Him happy. You goes show me you can smoosh tings good. Gets me four froglok tadpole fleshies for me to munchings on and me be happy.. um, He, the Warlord be so berry happy. Helping our tuff friends de Greenbloods but be watching for dem scummy Crakneks, dumb ogres dey is. No good, no our friends. Go now. Me.. er.. he waiting and hungry.");
	elseif(e.message:findi("bedder shaman")) then
		e.self:Say("Yoo want to be bedda shaman? Them lizards in de Feerrott tink de bedda den us and bodder us wit der majiks like fleas on a dog. Kill dem and bring me, um, one of dem bags dey wear around dem necks and, um, three of dem dolls dey hold.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13187, item2 = 13187, item3 = 13187, item4 = 13187})) then
		e.self:Say("Oh, me.. um.. Warlord BERRY happy. Berry like dese. Gimme. Uh, why is you still here? Take dis and gets more kills. You learning good, come sees me. I teaches you bout stuff. Make you [bedder shaman]. Go. He and me watching.");
		e.other:SummonItem(15093);
		e.other:Faction(295, 10);
		e.other:AddEXP(100);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14199, item2 = 13367, item3 = 13367, item4 = 13367})) then
		e.self:Say("Dis good stuff! Me and Warlord happy! Wear dis symbol and he make yoo strong with majik!");
		e.other:SummonItem(1444);
		e.other:Faction(295, 10);
		e.other:AddEXP(100);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18788})) then --Tattered Note
		e.self:Say("Take, take.. You now Shaman of War.. Zulort make you majik, too.");
		e.other:SummonItem(13526);	--Dirty Patched Fur Tunic*
		e.other:Ding();
		e.other:Faction(295,-100);	-- Shaman of War
		e.other:AddEXP(100);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quests by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
