function event_say(e)


	local rand = math.random(3);
	
	if (e.message:findi("hail")) or (e.message:findi("seeking work")) and (e.other:GetFaction(e.self) > 5) then	
		if (rand == 1) then
			e.self:Say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
		elseif (rand == 2) then
			e.self:Say("Is that your BREATH, or did something die in here?  Now go away!");
		elseif (rand == 3) then
			e.self:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
		end

	elseif (e.message:findi("hail")) and (e.other:GetFaction(e.self) > 5) then	
		e.self:Emote("glances over at you with a sneer and says, 'I have much to do and organize. If you have anything of importance to say you had best speak up now or leave before I lose my patience.'");
	elseif (e.message:findi("seeking work")) and (e.other:GetFaction(e.self) == 5) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	elseif (e.message:findi("seeking work")) and (e.other:GetFaction(e.self) < 5) then	
		e.self:Say("stops looking over his papers and takes a moment to size you up. You fight the urge to run in fear as the collosal humanoid considers you. After a moment he says, 'Very well. Our campaign to conquer the so called Tunarean Court has need of reinforcements. The Kromrif are already spread to thinly in the Eastern Wastes so mercenaries will have to do. Take these orders to the commanding officer in the field and follow his orders. Payment will be discussed after you complete your assignment.'");
		e.other:Ding();
		e.other:SummonItem(1702); --Mercenary Assignment
	end
	
end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1706})) then --Krofer Requisition
		e.self:Say("takes the note and begins reading. Seeing a certain passage, he squints and rereads, his brow furrowed. He glances over at you and says, 'Very well. I will assign you a squad lead by Corporal Hlash. They will rendezvous with you out in the field. Oh and take this back to Krofer.'");
		e.other:SummonItem(1707); --Signed Requisition
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  1709})) then --report of failure
		e.self:Emote("reads over the report, his face begins to turn red with anger. Drioc shouts, 'How can this be?! I sent you a squad of some of our best trained men and you had them destroyed!! This was supposed to be a routine raid and you return in FAILURE!! I would crush you under my boot right now if I wasn't so angry but I think I'll send you to my finacier. YOU can explain what happened and why his investments have been lost. Now take your carcass out of here!'");
		e.other:SummonItem(1709); --repot of failure
	end

	item_lib.return_items(e.self, e.other, e.trade);	

end
