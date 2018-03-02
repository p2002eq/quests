local spawn;
function event_spawn(e)
	spawn = 0;
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. ". Are you perchance a [" .. eq.say_link("i am a minstrel",false,"minstrel") .. "]?");
	elseif(e.message:findi("i am a minstrel")) then
		e.self:Say("I, too, am a bard, or was rather. I have been cursed by that blasted pile of bones who calls itself, [" .. eq.say_link("Trakanon") .. "].");
	elseif(e.message:findi("trakanon")) then
		e.self:Say("He is the undead dragon who rules this realm. I came on a quest seeking strings for my [" .. eq.say_link("new instrument") .. "].");
	elseif(e.message:findi("new instrument")) then
		e.self:Say("I sought to create a [" .. eq.say_link("Magical Lute") .. "].");
	elseif(e.message:findi("magical lute")) then
		e.self:Say("One that would make me the greatest bard in all the lands! Are you on a [" .. eq.say_link("i am on a similar quest",false,"similar quest") .. "]?");
	elseif(e.message:findi("i am on a similar quest")) then
		e.self:Say("Excellent. I have stayed here far too long and I wish to go to my eternal slumber. But before I do so, I ask for one [" .. eq.say_link("last request") .. "].");
	elseif(e.message:findi("last request")) then
		e.self:Say("Well then, I would ask you a favor for one in return. If I bring that cursed dragon here, will you [" .. eq.say_link("i will kill it for you",false,"kill it for me") .. "]?");
	elseif(e.message:findi("i will kill it for you")) then
		e.self:Say("Give me the Mystical Lute Body you have. I will return it, don't worry. I only wish to hold an instrument one last time before I leave.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20536})) then --Mystical Lute Body
		e.self:Say("I feel so powerful once again...a strange feeling is overcoming me!");
		e.other:QuestReward(e.self,0,0,0,0,20536); --Mystical Lute Body
		eq.attack(e.other:GetName());
		spawn = 1;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if(spawn == 1) then
		eq.spawn2(89181,0,0,-693,-2103,-140.62,0.0,1);
		spawn = 0;
		if qglobals.UDB_timer ~= nil then
			eq.delete_global("UDB_timer");
		end
	end
end
