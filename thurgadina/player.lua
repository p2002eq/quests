prayers = {0, 0, 0} -- array to hold prayer checks

function event_say(e)
	if(e.message:findi("Oh Brell, Thank you for protecting me and seeing me through my trials. Forgive me for the things I think and say and do that displease you. Please reveal to me your will and bless me with the patience and obedience to do that which you desire. Amen.")) then	-- prayer
		myX = e.self:GetX()
		myY = e.self:GetY()
		if(between(myX, 796, 800) and between(myY, -292, -288)) then -- check for prayer in location 1
			prayers[1] = 1
		elseif(between(myX, 766, 770) and between(myY, -308, -304)) then -- check for prayer in location 2
			prayers[2] = 1
		elseif(between(myX, 781, 785) and between(myY, -335, -331)) then -- check for prayer in location 3
			prayers[3] = 1
		end

		if(sum(prayers) == 3) then -- if prayer has been said in all three locations, gives emote and creates ground spawn with 1-minute timer
			e.self:Message(1, "You have been inspired. The sacred pattern of the Coldain rune materializes on the ground before you.")
			eq.create_ground_object(1855, 801.76, -319.64, -12, 0, 60000)
			prayers = {0, 0, 0}
		end
	end
end


function between(loc, limit_low, limit_high) -- helper function to check that values are between targets
	if(loc <= limit_high and loc >= limit_low) then
		return true
	else
		return false
	end
end

function sum(t) -- helper function to sum array (wtf? why does lua not have this built in?)
    local sum = 0
    for k,v in pairs(t) do
        sum = sum + v
    end

    return sum
end