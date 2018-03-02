-- Hollow Skull
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("%s! Make it quick I am in a [" .. eq.say_link("hurry") .. "].",e.other:GetName()));
	elseif(e.message:findi("hurry")) then
		e.self:Say("I was in Paw receantly and stole a skull and now an [" .. eq.say_link("assassin") .. "] is hunting me down, even after returning the skull to him.");
	elseif(e.message:findi("assassin")) then
		e.self:Say(string.format("Look %s, I don't have time to talk! If you want to help me deliver this [" .. eq.say_link("message") .. "].",e.other:GetName()));
	elseif(e.message:findi("message")) then
		e.self:Say("Hurry now and take this to my brother, Hyrill Pon in Freeport, and before you go take that skull back from the assassin");
		e.other:SummonItem(18010);
		eq.spawn2(12005,0,0,-15188.57,1270.43,68.72,218.0);
		e.self:Say("oh no, there he is!");
	end
end
