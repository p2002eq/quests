local items = {9982,9990,9991,9998,9999,9993,9985,9984,9983,9986,9989,9988,9994,9987,9979,9992,10026,10307,10015,13080,13073,100001,100002,100003,100004,100005,100006,100007,100008,100009,100010};
local players = {};
local instanceId = 71;

function event_say(e)
	if (e.message:findi("hail")) then	
		e.self:Say("Well met stranger.  I am looking for new adventures who would like to take part in an [" .. eq.say_link("event") .. "].");
	elseif(e.message:findi("event")) then
		e.self:Say("The event will take place in a far away location that only I can send you to. You must be level one to participate, and be forewarned, only the starter items will be allowed to travel through with you.  Let me know when you are ready to [" .. eq.say_link("join") .. "].");
	elseif(e.message:findi("join")) then
		if (e.other:GetLevel() == 1) then
			for i = 0, 29 do
				if (e.other:GetItemIDAt(i) > 0) then
					if (has_value(items,e.other:GetItemIDAt(i)) == false) then
						e.other:DeleteItemInInventory(i,0,true);	
					end
				end
			end			
			if (has_value(players,e.other:GetName()) == false) then
				e.other:SetEXP(0,0);
				table.insert(players,e.other:GetName());
				eq.assign_to_instance(instanceId);
			end
			e.other:MovePCInstance(17, instanceId, -55,127,3, 177);
		else
			if (has_value(players,e.other:GetName()) == true) then
				for i = 0, 29 do
					if (e.other:GetItemIDAt(i) > 0) then
						if (has_value(items,e.other:GetItemIDAt(i)) == false and e.other:GetItemIDAt(i) < 100000) then
							e.other:DeleteItemInInventory(i,0,true);	
						end
					end
				end		
				e.other:MovePCInstance(17, instanceId, -55,127,3, 177);
			else
				e.self:Say("You are too experienced to join in this event, maybe next time.");
			end
		end
	end
end

function event_spawn(e)
	e.self:TempName("Event_Coordinator");
	e.self:ChangeSize(7);
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
