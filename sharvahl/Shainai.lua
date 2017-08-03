-- NPCID 155339
function event_spawn(e)
	eq.disable_spawn2(32803);
end

function event_waypoint_arrive(e)
	if(e.wp==21) then
		e.self:Say("Yup yup, I definitely know the way from here.");
	end
	if(e.wp==36) then
		e.self:Say("Ahhh, home at last.");
		eq.signal(155041,1,10); -- #Delival
	end
end

function event_signal(e)
	if(e.signal==1) then
		e.self:Say("Daddy I'm sleepy, could you come tuck me in ?");
		eq.signal(155340,1,10); -- Delival
		e.self:SetAppearance(3); -- Laying Down / FD
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4478})) then -- Shainais Blanket
		e.self:Emote("settles comfortably in for restful afternoon nap, 'Thank you for walking me home, it was ever so nice of you.  Goodnight.'");
		e.other:Ding();
		eq.signal(155340,2,10); -- Delival
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
