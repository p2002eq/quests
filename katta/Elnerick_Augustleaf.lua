
function event_say(e)
	if eq.get_qglobals()["EarringVeracity3"] == 1 then -- if player did 3rd earring...
		if e.message:findi(hail) then
			e.self:Say(string.format("Greetings %s. I am Magistrate Elnerick Augustleaf of Katta Castellum and the Loyalist Empire. If it is arcane knowledge that you seek you have come to an excellent place to study. Not only do we have wondrous magical resources available at the Magus Conlegium but the teachings of Tsaph Katta are well known to all of our citizens and aid in preparing the mind for the freedom of thought and mental and emotional discipline needed to become a great wizard.", e.other:GetName()));
		elseif e.message:findi(serve katta) then
			e.self:Say("Ah, I was told you would come. I hope that you have retrieved the shards from each Praesertum Leader? Please show them to me.");
		end
	end
end


function event_trade(e)
	local item_lib=require("items");
	
	-- 29881 :  Shard of the Shoulder
    -- 29882 :  Shard of the Eye
    -- 29883 :  Shard of the Hand
    -- 29884 :  Shard of the Heart
	if eq.get_qglobals()["EarringVeracity3"] == 1 and item_lib.check_turn_in(e.self, e.trade, { item1 = 29881, item2 = 29882, item3 = 29883, item4 = 29884 }) then
		e.other:SummonItem(3650); -- 3650  Arx Key
		e.other:SummonItem(7096); -- 7096  Seal of Katta
		e.self:Emote("takes the four shards and places them on the table. Slow incantations and streams of mana flow from him. The shards begin to move across the table towards each other until they fuse into one.");
		e.self:Say("I have focused each shard into one single key. The magic holding it together is strong but the enchantment will fade over time. You will must use it wisely for it will deteriorate with use. Lcea has requested I give you this seal to prove your service to this city. Take the seal and the Arx Key, I hope that you can accomplish what you are about to be asked. May your service to this town never be forgotten.");
		e.other:Faction(52,50); -- concillium universus
		e.other:Faction(284,-5); -- seru
		e.other:Faction(142,-25); -- heart of seru
		e.other:AddExp(500000);
	end

	item_lib.return_items(e.self, e.other, e.trade); -- return unused items
end

 -- End of File, Zone:katta  NPC:160153 -- Elnerick_Augustleaf


