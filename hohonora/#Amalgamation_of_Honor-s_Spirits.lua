--Amalgamation_of_Honor`s_Spirits 
--Symbol of the Ducee Quest
--hohonora

--[[ QGLOBAL INDEX:

	1:	Completed Battlecloak of the Ferocious
	2:	Completed Ethereal Cloak of Symbols (Quest Completed)
	
]]

function event_spawn(e)
	eq.set_timer("time_check",5 * 1000);
	eq.zone_emote(7,"The spirits of Honor's fallen Heroes begin to coalesce in front of you.");
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.other:GetFaction(e.self) < 4 then --must be amiable
		if e.message:findi("hail") and qglobals.Amalgamation == nil then
			e.self:Emote("echoes in your mind, 'We are the spirits that reside in these halls. Within us are all the great victories we knew while we still resided in our corporeal forms. We have fought great battles throughout these Planes. You may know the Honor of the battles we have fought. Do you wish to [" .. eq.say_link("test your skill in battle") .. "]?'");
		elseif e.message:findi("test your skill in battle") and qglobals.Amalgamation == nil then
			e.self:Emote("echoes in your mind, 'Very well. Our tasks are not simple, not by any means. If you succeed, then you will have proven your Honor. Should you fail, and fall against the Foes of Virtue, perhaps one day your soul will join us in these halls. Come back when you have gathered from a Nightmare Hoof and a lock of Banshee hair from the realm of Nightmares, and from Bertoxxulous' diseased plane, the tattered clothing of a Leperoth as well as the wings of a Malarian.'");
		elseif e.message:findi("continue your service") and tonumber(qglobals.Amalgamation) == 1 then
			e.self:Emote("echoes in your mind, 'Excellent. Many Eons ago three of our greatest Ducee were sent out to battle. One went to battle the Heroes of Bertoxxulous, one went to fight the Minions of Zek, and one went to wage war in the Realm of Torment. All three Ducee vanished without a trace; their souls never joined the rest of the warriors of Marr so we fear that their spirits may be bound to their battlefields. By returning to us the Symbols worn by the Sergeants of the Ducee we will be able to summon the souls of the fallen here so they may rest with us where they belong.'");
		end
	else
		if e.message:findi("hail") then
			e.self:Say("Oh look, a talking lump of refuse. How novel!");
		end
	end
end
		
function event_timer(e)
	if e.timer == "time_check" then
		ZoneTime = eq.get_zone_time();
		if ZoneTime.zone_hour >= 5 then	--depop at 5am
			eq.depop();
		end
	end
end

function event_trade(e)
    local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if qglobals.Amalgamation == nil and e.other:GetFaction(e.self) < 4  and item_lib.check_turn_in(e.self, e.trade, {item1 = 28710, item2 = 28709, item3 = 28724, item4 = 28725}) then  --Lock of Tangled Banshee Hair, Nightmare Hoof, Malarian Wing, Tattered Leperoth Clothing 
		e.self:Emote("echoes in your mind, 'Well done, you have proven yourself to us. Here is your reward. You may continue our tasks, if you are willing. You have already succeeded where few dare to try, you may [" .. eq.say_link("continue your service") .. "] to us, if you wish; however do not lose the trinket we gave you, you will need it to proceed.'");
		e.other:QuestReward(e.other,0,0,0,0,34143, 25000);  --Battlecloak of the Ferocious (need item created)
		eq.set_global("Amalgamation","1",5,"F");
	elseif tonumber(qglobals.Amalgamation) == 1 and e.other:GetFaction(e.self) < 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 34143 , item2 = 28730, item3 = 32064, item4 = 32065}) then	--Battlecloak of the Ferocious, Symbol of the Ducee Imperon, Symbol of the Ducee Cupidon, Symbol of the Ducee Fideson
		e.other:Message(7,"A warm breeze blows through your body, and the Amalgam glows in a warm light. The Amalgam echoes in your mind, 'You have done quite well. Their souls are now part of us. We thank you. This is a small token of our gratitude. Wear it with pride as you have earned it. The battle rages on, remember that your Honor is reflected in what you do as well as what you have done. Farewell " .. e.other:GetName() .. ".'");
		e.other:QuestReward(e.other,0,0,0,0,34144, 75000);  -- Cloak of Ethereal Symbols  (need item created)
		eq.set_global("Amalgamation","2",5,"F");	--finished
		eq.depop();
	end	
	
    item_lib.return_items(e.self, e.other, e.trade)
end