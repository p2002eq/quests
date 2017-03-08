-- Ungdin in Thurgadin for Hammerfal quest

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Uuuuhhh, how goes it, " .. e.other:Race() .. "? Oh, I'm doin' jest fine down here, just hanging around... Mining! Yes mining for our fearless leader, the Dain. Yessiree... sssoooooo...");
	end
end

function event_trade(e)

	local item_lib = require('items');
	local qglobals = eq.get_qglobals(e.self, e.other);

	if item_lib.check_turn_in(e.self, e.trade, {item1 = 1725}) then
		e.self:Say("Hmmm, not sure why you're giving me all this. <cough> 50 pieces <cough> of platinum <cough> Whew, wow, I may be coming down with <cough> and the note <cough> something.");
		eq.set_global("shipment", "1", 0, "F");
	elseif qglobals['shipment'] == '1' then
		e.self:Say('shipment');
		if item_lib.check_turn_in(e.self, e.trade, {platinum = 50}) then	
			e.self:Emote("'s eyes dart about the room before retrieving a large box from under the table. He takes the platinum and the note, then hands you the box without a word.");
			e.other:SummonItem(29064);
			eq.delete_global("shipment");
		end
	end

	item_lib.return_items(e.self, e.other, e.trade);	

end
