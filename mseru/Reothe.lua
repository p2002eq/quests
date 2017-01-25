 -- Earring of Veracity #1 (Insignia)
 -- Sanctus Seru : torsten reidan
 -- Marus Seru : reothe
 -- Netherbian Lair : Legionnaire Dalini, spawned Bregun Dorey

function event_say(e)
	if e.message:findi(Where is Bregun Dorey) then
		e.self:Say("Bregun Dorey... I have not heard that name in many years. I will never forget it. He was very unique, always running around with an odd metal hat on. He swore that it would keep out the mind probing magics of the Question. I know where he was last seen, and I will tell you if you help by getting us some [supplies].");
	elseif e.message:findi(what supplies) then
		e.self:Say("Get me two Bark Potions, a Spring Crystal, and a Harvest Crystal. I will tell you where I last saw him headed. If you buy them in Sanctus Seru do not tell them you are giving aid to the Recuso or you shall be prosecuted as well.");
	end
end

function event_trade(e)
	local item_lib=require("items");
 
	-- Bark potion x2, spring crystal x1, harvest crystal x1
	if (item_lib.check_turn_in(e.self, e.trade, { item1 = 14519, item2 = 14519, item3 = 14512, item4 = 14511 })) then
		e.self:Say("This is great! We can treat our injured and have something to eat for weeks. I can vaguely recall Bregun heading towards the Lair of the Netherbians. You might ask a guard there if they have seen him.");
		e.other:AddExp(40000);
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
