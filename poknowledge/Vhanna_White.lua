-- Vhanna_White (202367)
-- GM Item reimbursement NPC
-- poknowledge

function event_say(e)
	local reward = eq.say_link("Award or Prize");
	
	if(e.message:findi("hail")) then
		e.other:Message(7,string.format("Vhanna tells you, 'Hello %s, Are you here to collect an [%s]?  I can check if there is anything for you.'",e.other:GetName(),reward));
	elseif(e.message:findi("Award or Prize")) then

		AwardID = 0;
		item = 0;
		AwardReason = "";
		mysql = require("luasql_ext");
		
		for id,CharID,Item_id,Reason in mysql.rows(con,string.format("SELECT * from cust_playerawards where CharID = %s and Reimbursed = 0", e.other:CharacterID())) do
			AwardID = tonumber(id);
			item = tonumber(Item_id);
			AwardReason = Reason;
			e.other:Message(18,string.format("DEBUG: ID [%s] CharID [%s] ItemID [%s] Reason[%s]",AwardID,e.other:CharacterID(),item,AwardReason));	--debug
			break;	--to pull earliest entry first
		end 
		
		
		if item ~= 0 then
			e.other:Message(7,string.format("Vhanna tells you, 'I have a prize for you,  %s!  Please accept this item. (Reason: %s)'",e.other:GetName(),AwardReason));
			e.other:SummonItem(item);	--summon item
			query = string.format("UPDATE cust_playerawards SET Reimbursed = 1 WHERE id = %s",AwardID)
			update = mysql.rows(con,tostring(query))
		else
			e.other:Message(7,string.format("Vhanna tells you, 'I have nothing for you at this time, %s.'",e.other:GetName()));
		end
	end
end
		
		