--Lord Korzin is for the Greenmist quest and administers the third quest in the line.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What is it you seek? [" .. eq.say_link("Eternal suffering") .. "]?");
	elseif(e.message:findi("eternal suffering")) then
		e.self:Say("Then follow the words of Cazic-Thule and may his blessed curses rain upon your soul as they shall on all of his faithful servants. Were you [" .. eq.say_link("sent") .. "] to me by Gikzic?");
	elseif(e.message:findi("sent")) then
		e.self:Say("Then you must be the squire who found the ancient tome, 'The Origins of Pain'. I can use a talented crusader such as yourself. In my dreams, Cazic-Thule has spoken to me. He instructed me to seek out the 'Skull of Torture' which was last reported to be within the torture tower of the ancient Lord of Pain, Kurn. Will you [" .. eq.say_link("accept the calling") .. "]?");
	elseif(e.message:findi("accept the calling")) then
		e.self:Say("As if you had a choice. Seek out the tower of Kurn and find the Skull of Torture. You should be able to easily recognize this skull as it glows with the power of Cazic Thule. Return it to me with your squire's khukri and I shall reward you with the knight's khukri. Go at once.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12401, item2 = 5122})) then -- A Glowing Skull and Squire's Khukri
		e.self:Say("Excellent work! You are no squire. You are now a knight of the crusaders. Your next step shall be zealot. And every zealot wields a magical khukri.");
		e.other:Faction(62,20); -- Crusaders of Greenmist
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,15,0,5123,e1500xp); -- Knights Khukri
	end
	item_lib.return_items(e.self, e.other, e.trade)
end