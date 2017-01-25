 -- Earring of Veracity #1 (Insignia)
 -- Sanctus Seru : torsten reidan
 -- Marus Seru : reothe
 -- Netherbian Lair : Legionnaire Dalini, spawned Bregun Dorey


function event_say(e)
	if e.message:findi(Bregun Dorey) then
		e.self:Say("Yeah maybe I know Bregun. You know, I sure am thirsty with all this guard work I am doing. I know what I want, some Dawnshroud Cider! Yeah, go fetch me a cider and we will see if I remember anything when you get back.");
	end
end


function event_trade(e)
	local item_lib=require("items");

	if (item_lib.check_turn_in(e.self, e.trade, { item1 = 29851 })) then -- dawnshroud cider
		e.self:Say("Dorey usually roams in the troglodyte caves, you might find him there.");
		-- spawns bregun dorey, near a trog hunter
		eq.unique_spawn(161077,0,0,-372,-95,10,88);
	end

	item_lib.return_items(e.self, e.other, e.trade);
end


