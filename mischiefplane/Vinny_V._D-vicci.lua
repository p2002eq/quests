--[[#Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126
#
#NPC Name: Vinny V. D'vicci]]

function event_say(e)
	if (e.message:findi("pot of gold")) then
		e.self:Say("Pot o` gold? Bwahahahaha! Only pot around is them ones I warsh my clothes in. Gotta be careful though, one time I dropped one of dem woids of wealth in and BADABING no clothes jus a stinkin coin that wouldn't buy me a fishin grub.");
	end
end

