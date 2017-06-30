-- Shaman Skull Quest #6
function event_say(e)
	local qglobals = eq.get_qglobals(e.other,e.self);
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ", Perhaps you've come to purchase some of my rare supplies? I have a special blend of eleven herbs and spices......oh wait.....I'm sold out of that......anyway. What can I do for you?");
	elseif(e.message:findi("Vagnar") and tonumber(qglobals.shmskullquest) >= 7 and e.other:GetFaction(e.self) < 6) then
		e.self:Say("Vagnar? I don't recall.....Unless Vagnar was that shaman supposedly on some quest to save our entire race from total destruction..someone always on one of those. He bought some charms to ward of [Dragon kin]. He's most likely in the belly of some beast now.");
	elseif(e.message:findi("Dragon kin") and tonumber(qglobals.shmskullquest) >= 7 and e.other:GetFaction(e.self) < 6) then
		e.self:Say("Yes he said he needed to steal secrets from the hated Sarnaks to aid him in his true quest. He said the sarnak know ways to cleanse the mind from intrusion, he would say no more.");
		eq.set_global("shmskullquest","9",5,"F"); -- Completed Cudgel Quest 6.2
	end
end