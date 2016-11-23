function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
        if(e.message:findi("Hail")) then
                if(qglobals["Name_Changed"] == "1") then
			e.self:Say("My oh my, we have already changed your identity once in the past. Sadly you will need to commune with a God. I highly doubt they will make the requested change if we have assisted you in the last 6 months. I suggest you start with a forum post about your request.")
		else
                	e.self:Say("Shhhh, Be quiet! I hear you would like a new life, however we do not take this change lightly. To prove your dedication to this change. Please gather the following [items]. Please also heed our [Warnings].")
                end
	elseif(e.message:findi("items")) then
                e.self:Say("Locate four ground spawns and combine them in a bag found at the base of a waterfall where the river in Stonebrunt Starts. First item is located in front of a throne in a dangerous Arena. Second item is located in a room full of firepots. Third is located near a very large gorillia. The Last item is located near a very large lizard.")
        elseif(e.message:findi("Warnings")) then
		e.self:Say("This task can only be completed once every 6 months, attempts to utilize our protection services more often will be a waste of time.")
	end
end

function event_trade(e)
        local item_lib = require("items");
        if(item_lib.check_turn_in(e.self, e.trade, {item1 = 34026})) then--Witness Protection Bribes
                e.self:Emote("Sorts the tokens and thinks he is being swindled.")
		e.self:Say("Fine, take your papers and leave. Speak to a god when they are around and provide them the papers. I suggest starting with a Forum Post, ensure you inform them that you have the papers")
                e.other:QuestReward(e.self,0,0,0,0,34024,0);--New Identity Papers
		eq.set_global("Name_Changed","1",5,"F")
        end
        item_lib.return_items(e.self, e.other, e.trade)
end
