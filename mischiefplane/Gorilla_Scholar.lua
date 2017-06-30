--Gorilla Scholar 
--Plane of Mischief 1.0

--script to add random chance to aggro upon being hailed
  
function event_say(e)
	local chance = math.random(0,100)
	if (e.message:findi("Hail") and chance <= 5) then
		e.self:Emote("throws the book he was chewing on to the ground and attacks.")
		e.self:AddToHateList(e.other);
	end
end

--[[  Original Perl Script
sub EVENT_SAY {
 my $chance = int(rand(100));
 if($text=~/hail/i && $chance == 7){ 
  quest::attack($name);
 }
}
]]
