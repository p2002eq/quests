--Hall Monitor Willy 
--Plane of Mischief 1.0

--script to cause NPC aggro upon hailing per http://theplaneofmischief.yuku.com/topic/419/Death-and-Mischief#.WSx5jWjytPY
 

 
function event_say(e)
	if (e.message:findi("Hail")) then
		e.self:Say("QUIET!!! People are trying to study around here! Keep your yap shut! ") 
		e.self:AddToHateList(e.other);
	end
end

