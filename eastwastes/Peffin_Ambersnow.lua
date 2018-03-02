function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Emote("gasps in astonishment, 'Oh, I uh... err, hello there. Umm, thank Brelll you're here, those bloody Kromrif were going to torture me! Yes, yes, and you've saved me! How can I ever repay you?");
	elseif (e.message:findi("murdrick")) then	
		e.self:Emote("looks away and stammers, Ehh, ahh, Mur who?");
	elseif (e.message:findi("berradin")) then	
		e.self:Say("goes even paler than usual, Hmm, Berradin you say? Sorry, but I've never even heard the name.");
	end
end

function event_spawn(e)
	e.self:SetInvisible(1);
end

function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 18171})) then -- letter to peffin
		eq.spawn2(116182,0,0,3364,-1579,163.8,71.6);
		eq.spawn2(116182,0,0,3314,-1557,163.8,84.8);
		eq.spawn2(116182,0,0,3355,-1625,163.8,73.8);
		e.self:Emote("yells for assistance");
		eq.unique_spawn(116606,0,0,3419.4,-1739.7,143.9,383.0);
		eq.depop_with_timer();
	end
end
