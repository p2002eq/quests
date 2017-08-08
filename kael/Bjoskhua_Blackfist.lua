function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What is it you want, mortal? I have little patience for those who do not come here to [" .. eq.say_link("study") .. "].'");
	elseif(e.message:findi("study")) then
		e.self:Say("What is it you wish to study?");
	elseif(e.message:findi("clrakk")) then
		e.self:Say("Clrakk is my youngest brother. He walks a path of shadows and deceit. If he were to battle, it would not be one without weapons or armor. I may use these as a bargaining chip some day. I do not think my family has any more need of these old [" .. eq.say_link("chest straps") .. "].");
	elseif(e.message:findi("chest straps")) then
		e.self:Say("The chest straps are simply a status symbol to some gladiators and warriors. They are passed down from generation to generation. When a warrior enters one of these contests of the [" .. eq.say_link("fist") .. "], they wear the chest straps of their family. My family was awarded a set of the enchanted chest straps ages ago. None of my brothers save Clrakk would even consider entering the contest.");
	elseif(e.message:findi("fist")) then
		e.self:Say("Ages ago there was a race of fish men named the Kedge. Prexus spread them throughout the waters of the world and they were prosperous. Rumors abound that even near the waters of velious they had great cities. All at once they seemed to be wiped from the face of Norrath. One of the travelers I recently spoke to informed me that a single Kedge may still live in the lands of Faydwer. As grotesque as it sounds, the backbone of a Kedge may be used to create indestructible scroll cases. Bring me the backbone of this fishman, if he exists, and you will find yourself a richer person.");
	end

end

function event_trade(e)
local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 20524})) then
		e.self:Say("Excellent, I guess his entire race is now wiped from Norrath. This will indeed make a wonderful scroll case. I am a giant of my word. Take your prized item and be gone, you greedy little beast!");
		e.other:SummonItem(25053);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
