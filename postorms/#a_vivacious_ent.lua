--#a_vivacious_ent (210483)
--Falto,_Lord_of_Thunder (210468) Event
--Zone: Postorms

function event_say(e)
	local group = e.other:GetGroup();
	local raid = e.other:GetRaid();
	local zone_id = eq.get_zone_id();
	local raid_id = raid:GetID();
	local raid_group = raid:GetGroup(e.other:GetName());
	
	if e.message:findi("hail") then
		e.other:Message(7,"The tree is but a weak reflection of a once proud and strong part of nature. With a slow and solemn voice, it speaks to you, 'I thank you for what you have done here today, ridding us of the maniacal ways of the Lord of Thunder. You cannot understand the plight we have been through, nor how much you have truly helped us by this most generous of acts. When you are [" .. eq.say_link("we are ready", false, "ready") .. "] ready to return to Relv, let me know and I will assist you in getting back through the brush to the other side.");
	elseif e.message:findi("we are ready") then
		e.self:Emote("chants an ancient entian dialect that you do not understand and sends you back through the underbrush to meet up again with Relv the Mysterious.");	
		
		--Raid Member handling
		local client_list = eq.get_entity_list():GetClientList();
		if client_list ~= nil then
			for client in client_list.entries do
				if client:IsRaidGrouped() and client:GetRaid():GetID() == raid_id and client:GetRaid():GetGroup(client:GetName()) == raid_group then
					if client:CastToMob():CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
						client:MovePC(zone_id,1580,2130,-446,350); -- needs_heading_validation
					end
				elseif client:CharacterID() == e.other:CharacterID() then
					client:MovePC(zone_id,1580,2130,-446,350); -- needs_heading_validation
				end
			end
		end	
	
		e.other:Message(7,"The tree ruffles its leaves down upon you and in a flash of vibrant green, you are transported back beyond the brush to once again speak with Relv the Mysterious.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
